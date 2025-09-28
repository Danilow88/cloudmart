// src/config/supabaseConfig.js
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

// Verificação das variáveis de ambiente
if (!supabaseUrl || !supabaseAnonKey) {
  console.error('Supabase URL e Anon Key são necessários. Verifique suas variáveis de ambiente.')
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey)

// Função para testar a conexão
export const testSupabaseConnection = async () => {
  try {
    const { data, error } = await supabase
      .from('_test')
      .select('*')
      .limit(1)
    
    if (error && error.code !== 'PGRST116') { // PGRST116 = table not found (ok para teste)
      throw error
    }
    
    console.log('✅ Conexão com Supabase estabelecida com sucesso!')
    return true
  } catch (error) {
    console.error('❌ Erro ao conectar com Supabase:', error.message)
    return false
  }
}

// Funções utilitárias para operações comuns
export const supabaseUtils = {
  // Inserir dados
  async insert(table, data) {
    const { data: result, error } = await supabase
      .from(table)
      .insert(data)
      .select()
    
    if (error) throw error
    return result
  },

  // Buscar dados
  async select(table, filters = {}, options = {}) {
    let query = supabase.from(table).select('*')
    
    // Aplicar filtros
    Object.entries(filters).forEach(([key, value]) => {
      query = query.eq(key, value)
    })
    
    // Aplicar opções (limit, order, etc.)
    if (options.limit) query = query.limit(options.limit)
    if (options.orderBy) query = query.order(options.orderBy.column, { ascending: options.orderBy.ascending })
    
    const { data, error } = await query
    
    if (error) throw error
    return data
  },

  // Atualizar dados
  async update(table, id, data) {
    const { data: result, error } = await supabase
      .from(table)
      .update(data)
      .eq('id', id)
      .select()
    
    if (error) throw error
    return result
  },

  // Deletar dados
  async delete(table, id) {
    const { error } = await supabase
      .from(table)
      .delete()
      .eq('id', id)
    
    if (error) throw error
    return true
  }
}

export default supabase