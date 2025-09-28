// src/services/supabaseService.js
import { supabase } from '../config/supabaseConfig';

export const supabaseService = {
  // ========== PRODUTOS ==========
  products: {
    // Buscar todos os produtos
    async getAll() {
      const { data, error } = await supabase
        .from('products')
        .select('*')
        .order('created_at', { ascending: false });
      
      if (error) throw error;
      return data;
    },

    // Buscar produto por ID
    async getById(id) {
      const { data, error } = await supabase
        .from('products')
        .select('*')
        .eq('id', id)
        .single();
      
      if (error) throw error;
      return data;
    },

    // Criar novo produto
    async create(product) {
      const { data, error } = await supabase
        .from('products')
        .insert([product])
        .select()
        .single();
      
      if (error) throw error;
      return data;
    },

    // Atualizar produto
    async update(id, updates) {
      const { data, error } = await supabase
        .from('products')
        .update(updates)
        .eq('id', id)
        .select()
        .single();
      
      if (error) throw error;
      return data;
    },

    // Deletar produto
    async delete(id) {
      const { error } = await supabase
        .from('products')
        .delete()
        .eq('id', id);
      
      if (error) throw error;
      return true;
    },

    // Buscar produtos por categoria
    async getByCategory(category) {
      const { data, error } = await supabase
        .from('products')
        .select('*')
        .eq('category', category)
        .order('name');
      
      if (error) throw error;
      return data;
    },

    // Buscar produtos com filtros
    async search(filters = {}) {
      let query = supabase.from('products').select('*');
      
      if (filters.name) {
        query = query.ilike('name', `%${filters.name}%`);
      }
      
      if (filters.category) {
        query = query.eq('category', filters.category);
      }
      
      if (filters.minPrice) {
        query = query.gte('price', filters.minPrice);
      }
      
      if (filters.maxPrice) {
        query = query.lte('price', filters.maxPrice);
      }
      
      const { data, error } = await query.order('name');
      
      if (error) throw error;
      return data;
    }
  },

  // ========== PEDIDOS ==========
  orders: {
    // Buscar todos os pedidos
    async getAll() {
      const { data, error } = await supabase
        .from('orders')
        .select(`
          *,
          order_items (
            *,
            products (name, price, image)
          )
        `)
        .order('created_at', { ascending: false });
      
      if (error) throw error;
      return data;
    },

    // Buscar pedidos por usuário
    async getByUser(userEmail) {
      const { data, error } = await supabase
        .from('orders')
        .select(`
          *,
          order_items (
            *,
            products (name, price, image)
          )
        `)
        .eq('user_email', userEmail)
        .order('created_at', { ascending: false });
      
      if (error) throw error;
      return data;
    },

    // Criar novo pedido
    async create(order, items) {
      // Começar transação
      const { data: orderData, error: orderError } = await supabase
        .from('orders')
        .insert([order])
        .select()
        .single();
      
      if (orderError) throw orderError;

      // Adicionar itens do pedido
      const orderItems = items.map(item => ({
        ...item,
        order_id: orderData.id
      }));

      const { error: itemsError } = await supabase
        .from('order_items')
        .insert(orderItems);
      
      if (itemsError) throw itemsError;

      return orderData;
    },

    // Atualizar status do pedido
    async updateStatus(id, status) {
      const { data, error } = await supabase
        .from('orders')
        .update({ status, updated_at: new Date().toISOString() })
        .eq('id', id)
        .select()
        .single();
      
      if (error) throw error;
      return data;
    }
  },

  // ========== TICKETS DE SUPORTE ==========
  tickets: {
    // Buscar todos os tickets
    async getAll() {
      const { data, error } = await supabase
        .from('support_tickets')
        .select('*')
        .order('created_at', { ascending: false });
      
      if (error) throw error;
      return data;
    },

    // Criar novo ticket
    async create(ticket) {
      const { data, error } = await supabase
        .from('support_tickets')
        .insert([ticket])
        .select()
        .single();
      
      if (error) throw error;
      return data;
    },

    // Atualizar ticket
    async update(id, updates) {
      const { data, error } = await supabase
        .from('support_tickets')
        .update(updates)
        .eq('id', id)
        .select()
        .single();
      
      if (error) throw error;
      return data;
    }
  },

  // ========== AUTENTICAÇÃO ==========
  auth: {
    // Fazer login
    async signIn(email, password) {
      const { data, error } = await supabase.auth.signInWithPassword({
        email,
        password
      });
      
      if (error) throw error;
      return data;
    },

    // Fazer registro
    async signUp(email, password, userData = {}) {
      const { data, error } = await supabase.auth.signUp({
        email,
        password,
        options: {
          data: userData
        }
      });
      
      if (error) throw error;
      return data;
    },

    // Fazer logout
    async signOut() {
      const { error } = await supabase.auth.signOut();
      if (error) throw error;
    },

    // Obter usuário atual
    async getCurrentUser() {
      const { data: { user } } = await supabase.auth.getUser();
      return user;
    },

    // Escutar mudanças de autenticação
    onAuthStateChange(callback) {
      return supabase.auth.onAuthStateChange(callback);
    }
  },

  // ========== STORAGE (UPLOAD DE IMAGENS) ==========
  storage: {
    // Upload de imagem
    async uploadImage(file, bucket = 'product-images', path = '') {
      const fileName = `${path}${Date.now()}_${file.name}`;
      
      const { data, error } = await supabase.storage
        .from(bucket)
        .upload(fileName, file);
      
      if (error) throw error;
      
      // Obter URL pública
      const { data: { publicUrl } } = supabase.storage
        .from(bucket)
        .getPublicUrl(fileName);
      
      return { ...data, publicUrl };
    },

    // Deletar imagem
    async deleteImage(fileName, bucket = 'product-images') {
      const { error } = await supabase.storage
        .from(bucket)
        .remove([fileName]);
      
      if (error) throw error;
      return true;
    }
  },

  // ========== REAL-TIME ==========
  realtime: {
    // Escutar mudanças em uma tabela
    subscribeToTable(table, callback, filter = '*') {
      return supabase
        .channel(`${table}_changes`)
        .on('postgres_changes', 
          { event: filter, schema: 'public', table }, 
          callback
        )
        .subscribe();
    },

    // Cancelar inscrição
    unsubscribe(subscription) {
      return supabase.removeChannel(subscription);
    }
  }
};

export default supabaseService;