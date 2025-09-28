# 🚀 Integração Supabase - CloudMart

Este projeto agora está configurado para se conectar ao Supabase! Siga os passos abaixo para configurar e testar a conexão.

## 📋 Pré-requisitos

1. Conta no [Supabase](https://supabase.com)
2. Projeto criado no Supabase
3. Node.js e npm instalados

## ⚙️ Configuração

### 1. Variáveis de Ambiente

Edite o arquivo `.env` na raiz do projeto com suas credenciais do Supabase:

```env
# Supabase Configuration
VITE_SUPABASE_URL=https://seu-projeto.supabase.co
VITE_SUPABASE_ANON_KEY=sua-chave-publica-anonima

# Existing API Configuration
VITE_API_BASE_URL=http://localhost:5000/api
```

### 2. Estrutura do Banco de Dados

Execute os seguintes comandos SQL no editor SQL do Supabase para criar as tabelas:

```sql
-- Tabela de Produtos
CREATE TABLE products (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10,2) NOT NULL,
  category VARCHAR(100),
  image VARCHAR(500),
  stock INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela de Pedidos
CREATE TABLE orders (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_email VARCHAR(255) NOT NULL,
  user_name VARCHAR(255),
  total DECIMAL(10,2) NOT NULL,
  status VARCHAR(50) DEFAULT 'pending',
  shipping_address TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela de Itens do Pedido
CREATE TABLE order_items (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
  product_id UUID REFERENCES products(id),
  quantity INTEGER NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela de Tickets de Suporte
CREATE TABLE support_tickets (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_email VARCHAR(255) NOT NULL,
  subject VARCHAR(255) NOT NULL,
  message TEXT NOT NULL,
  status VARCHAR(50) DEFAULT 'open',
  priority VARCHAR(20) DEFAULT 'medium',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela de Teste (opcional)
CREATE TABLE test_table (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Índices para melhor performance
CREATE INDEX idx_products_category ON products(category);
CREATE INDEX idx_orders_user_email ON orders(user_email);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_support_tickets_status ON support_tickets(status);
```

### 3. Configuração de Storage (Opcional)

Para upload de imagens de produtos:

1. Vá para Storage no painel do Supabase
2. Crie um bucket chamado \`product-images\`
3. Configure as políticas de acesso conforme necessário

## 🧪 Testando a Conexão

### Método 1: Página de Teste
Acesse \`http://localhost:3000/supabase-test\` para testar a conexão interativamente.

### Método 2: Console do Navegador
```javascript
import { testSupabaseConnection } from './src/config/supabaseConfig';
testSupabaseConnection();
```

## 📚 Como Usar

### Importando o Serviço
```javascript
import supabaseService from './src/services/supabaseService';
```

### Exemplos de Uso

#### Produtos
```javascript
// Buscar todos os produtos
const products = await supabaseService.products.getAll();

// Criar novo produto
const newProduct = await supabaseService.products.create({
  name: 'Produto Teste',
  description: 'Descrição do produto',
  price: 29.99,
  category: 'Eletrônicos',
  stock: 100
});

// Buscar produtos por categoria
const electronics = await supabaseService.products.getByCategory('Eletrônicos');
```

#### Pedidos
```javascript
// Buscar pedidos do usuário
const userOrders = await supabaseService.orders.getByUser('user@email.com');

// Criar novo pedido
const order = await supabaseService.orders.create(
  {
    user_email: 'user@email.com',
    user_name: 'João Silva',
    total: 99.99,
    shipping_address: 'Rua ABC, 123'
  },
  [
    { product_id: 'uuid-do-produto', quantity: 2, price: 49.99 }
  ]
);
```

#### Autenticação
```javascript
// Login
const { user } = await supabaseService.auth.signIn('email@exemplo.com', 'senha');

// Registro
const { user } = await supabaseService.auth.signUp('email@exemplo.com', 'senha', {
  name: 'João Silva'
});

// Logout
await supabaseService.auth.signOut();
```

#### Real-time
```javascript
// Escutar mudanças nos produtos
const subscription = supabaseService.realtime.subscribeToTable(
  'products', 
  (payload) => {
    console.log('Produto alterado:', payload);
  }
);

// Cancelar inscrição
supabaseService.realtime.unsubscribe(subscription);
```

## 🔧 Arquivos Criados/Modificados

- \`src/config/supabaseConfig.js\` - Configuração principal do Supabase
- \`src/services/supabaseService.js\` - Serviços para operações CRUD
- \`src/components/SupabaseTest/index.jsx\` - Componente de teste
- \`.env\` - Variáveis de ambiente
- \`src/App.jsx\` - Adicionada rota de teste

## 🚨 Segurança

- Nunca commite suas chaves privadas no repositório
- Use Row Level Security (RLS) no Supabase para proteger seus dados
- Configure políticas adequadas para cada tabela

## 📞 Suporte

Se encontrar problemas:
1. Verifique se as variáveis de ambiente estão corretas
2. Confirme se as tabelas foram criadas no Supabase
3. Verifique o console do navegador para erros
4. Teste a conexão na página \`/supabase-test\`

## 🎯 Próximos Passos

1. Substituir chamadas da API atual pelas do Supabase
2. Implementar autenticação completa
3. Configurar políticas de segurança (RLS)
4. Adicionar funcionalidades real-time
5. Implementar upload de imagens

---
*Configuração criada automaticamente para CloudMart* ✨