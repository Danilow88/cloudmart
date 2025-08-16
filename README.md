# Sistema de Gestão de Estoque SPARK e HQ1

Um sistema completo de controle de inventário desenvolvido em Python/Flask com suporte a código de barras, interface responsiva e funcionalidades avançadas de gestão de estoque.

## 🚀 Características

### 📱 **Interface Responsiva**
- **PC/Desktop**: Interface completa com todas as funcionalidades
- **Tablet**: Interface otimizada para dispositivos médios
- **Celular**: Interface compacta e funcional para smartphones

### 📊 **Módulos do Sistema**

#### **Dashboard**
- Cards de resumo com métricas importantes
- Ações rápidas para entrada/saída de estoque
- Atalhos para todas as áreas do sistema

#### **Inventários por Área**
- **Itens A&V Spark**: Equipamentos audiovisuais da unidade Spark
- **Itens A&V HQ1**: Equipamentos audiovisuais da unidade HQ1
- **Techstop HQ1**: Equipamentos tecnológicos HQ1
- **HQ1 8th**: Inventário do 8º andar HQ1
- **TVs e Monitores**: Equipamentos de vídeo
- **Lixo Eletrônico**: Controle de descarte
- **Inventário Oficial**: Controle oficial em progresso

#### **Gestão de Movimentações**
- **Entrada de Estoque**: Via código de barras com câmera/scanner
- **Saída de Estoque**: Controle de baixas com validação
- **Histórico Completo**: Rastreabilidade total das movimentações

#### **Relatórios e Consultas**
- Filtros avançados por data, tipo, origem
- Exportação para CSV
- Consultas personalizadas

### 🔍 **Funcionalidades de Código de Barras**

#### **Suporte Múltiplo**
- **Leitor USB**: Compatível com leitores de código de barras padrão
- **Câmera**: Escaneamento via câmera do dispositivo (PC/tablet/celular)
- **Entrada Manual**: Digitação direta quando necessário

#### **Tipos Suportados**
- Code 128, EAN, Code 39, UPC, Codabar, I2of5
- Mapeamento automático para campos Tag/Serial

## 🛠️ Instalação

### **Pré-requisitos**
- Python 3.8 ou superior
- pip (gerenciador de pacotes Python)

### **Passos de Instalação**

1. **Clone ou baixe o projeto**
   ```bash
   git clone <repository-url>
   cd spark-hq1-inventory
   ```

2. **Crie um ambiente virtual (recomendado)**
   ```bash
   python -m venv venv
   
   # Windows
   venv\Scripts\activate
   
   # Linux/Mac
   source venv/bin/activate
   ```

3. **Instale as dependências**
   ```bash
   pip install -r requirements.txt
   ```

4. **Execute a aplicação**
   ```bash
   python app.py
   ```

5. **Acesse o sistema**
   - Abra o navegador em: `http://localhost:5000`
   - **Usuário padrão**: `admin`
   - **Senha padrão**: `admin123`

## 📱 Uso do Sistema

### **Acesso Inicial**
1. Faça login com as credenciais padrão
2. O dashboard exibirá as métricas principais
3. Use o menu superior para navegar entre as seções

### **Entrada de Estoque**
1. Acesse "Movimentações > Entrada de Estoque"
2. Selecione a origem do item
3. Escaneie o código de barras ou digite manualmente
4. Se o item existir, os dados aparecerão automaticamente
5. Ajuste a quantidade e adicione observações
6. Confirme a entrada

### **Saída de Estoque**
1. Acesse "Movimentações > Saída de Estoque"
2. Selecione a origem e escaneie o código
3. Verifique a quantidade disponível
4. Informe quantidade a sair e destino
5. Confirme a operação

### **Scanner de Código de Barras**

#### **Via Câmera**
1. Clique no botão "Scanner" ou use `Ctrl+B`
2. Clique em "Iniciar Câmera"
3. Aponte a câmera para o código de barras
4. O código será detectado automaticamente

#### **Via Leitor USB**
1. Conecte o leitor USB
2. Clique no campo de código de barras
3. Escaneie normalmente - o código aparecerá no campo

### **Consulta de Inventários**
1. Acesse qualquer inventário via menu "Inventários"
2. Use filtros para buscar itens específicos
3. Clique nas ações da tabela para entrada/saída rápida
4. Visualize histórico de movimentações

## 🗂️ Estrutura do Projeto

```
spark-hq1-inventory/
├── app.py                 # Aplicação principal Flask
├── requirements.txt       # Dependências Python
├── README.md             # Esta documentação
├── templates/            # Templates HTML
│   ├── base.html         # Template base responsivo
│   ├── login.html        # Página de login
│   ├── dashboard.html    # Dashboard principal
│   ├── entrada_estoque.html
│   ├── movimentacoes.html
│   └── inventario_*.html # Páginas de inventário
├── static/              # Arquivos estáticos
│   ├── css/
│   │   └── style.css    # Estilos customizados
│   ├── js/
│   │   └── main.js      # JavaScript principal
│   └── img/             # Imagens do sistema
└── instance/            # Dados da aplicação
    └── inventory.db     # Banco de dados SQLite
```

## 🔧 Tecnologias Utilizadas

### **Backend**
- **Flask**: Framework web Python
- **SQLAlchemy**: ORM para banco de dados
- **SQLite**: Banco de dados embutido
- **Flask-Migrate**: Controle de versão do banco

### **Frontend**
- **Bootstrap 5**: Framework CSS responsivo
- **Bootstrap Icons**: Conjunto de ícones
- **JavaScript ES6**: Funcionalidades interativas
- **QuaggaJS**: Biblioteca de leitura de código de barras

### **Funcionalidades Especiais**
- **Responsividade**: Design adaptativo para todos os dispositivos
- **PWA Ready**: Pode ser instalado como app no celular
- **Offline Capable**: Funciona offline (com limitações)

## 📊 Campos do Sistema

### **Itens A&V Spark**
- ITENS, MODELO, Tag, Serial, Marca, Valor, Data de compra
- Fornecedor, PO, USO, QTD, AVENUE, STREET, OWNER

### **Itens A&V HQ1**
- Prateleira, Itens, Modelo, Tag, Serial, Marca
- Comprado em, QTY (just f UNIT), Custo, End of Life
- Número do pedido, Fornecedor, Local, Uso

### **Outros Inventários**
- Campos específicos conforme definido no YAML original
- Manutenção da estrutura exata das planilhas

## 🔒 Segurança

### **Autenticação**
- Sistema de login obrigatório
- Senhas criptografadas com hash
- Sessões seguras

### **Controle de Acesso**
- Usuários identificados em todas as operações
- Rastro completo de movimentações
- Logs de atividades

## 🚀 Funcionalidades Avançadas

### **Filtros e Busca**
- Filtros em tempo real nas tabelas
- Busca por múltiplos campos
- Filtros de data personalizáveis

### **Exportação**
- Exportação de relatórios em CSV
- Dados filtrados mantidos na exportação
- Formato compatível com Excel

### **Responsive Design**
- Interface otimizada para todos os tamanhos de tela
- Menus colapsáveis em dispositivos móveis
- Tabelas com scroll horizontal quando necessário

## 🔄 Fluxo de Dados

### **Entrada de Estoque**
1. Leitura do código de barras (Tag/Serial)
2. Busca do item nas bases de dados
3. Incremento da quantidade (QTD/Quantidade)
4. Registro na tabela de movimentações
5. Atualização da interface

### **Saída de Estoque**
1. Identificação do item por código
2. Validação de estoque disponível
3. Decremento da quantidade
4. Bloqueio de estoque negativo
5. Registro completo da operação

## 📞 Suporte

### **Problemas Comuns**

#### **Câmera não funciona**
- Verifique permissões do navegador
- Use HTTPS em produção
- Teste em diferentes navegadores

#### **Leitor USB não reconhecido**
- Verifique se está configurado como "teclado"
- Teste em campo de texto simples primeiro
- Verifique drivers do dispositivo

#### **Performance lenta**
- Limpe filtros desnecessários
- Use paginação nas consultas grandes
- Considere indexação do banco de dados

### **Customização**

O sistema foi desenvolvido para ser facilmente customizável:
- **Novos campos**: Adicione no modelo de dados
- **Novos relatórios**: Crie novos templates
- **Integração**: APIs REST podem ser adicionadas
- **Temas**: CSS totalmente customizável

## 📄 Licença

Este projeto foi desenvolvido especificamente para as necessidades do sistema SPARK e HQ1. Todos os direitos reservados.

---

**Desenvolvido com ❤️ para otimizar a gestão de inventário**
