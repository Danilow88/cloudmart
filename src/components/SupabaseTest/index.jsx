import React, { useState, useEffect } from 'react';
import { supabase, testSupabaseConnection, supabaseUtils } from '../../config/supabaseConfig';

const SupabaseTest = () => {
  const [connectionStatus, setConnectionStatus] = useState('testing');
  const [testData, setTestData] = useState([]);
  const [loading, setLoading] = useState(false);
  const [message, setMessage] = useState('');

  useEffect(() => {
    checkConnection();
  }, []);

  const checkConnection = async () => {
    setLoading(true);
    try {
      const isConnected = await testSupabaseConnection();
      setConnectionStatus(isConnected ? 'connected' : 'error');
      setMessage(isConnected ? 'Conexão estabelecida com sucesso!' : 'Erro na conexão');
    } catch (error) {
      setConnectionStatus('error');
      setMessage(`Erro: ${error.message}`);
    }
    setLoading(false);
  };

  const testInsert = async () => {
    setLoading(true);
    try {
      // Exemplo de inserção (você precisa ter uma tabela 'test_table' no Supabase)
      const result = await supabaseUtils.insert('test_table', {
        name: 'Teste ' + new Date().toLocaleTimeString(),
        description: 'Dados de teste inseridos via React'
      });
      setMessage('Dados inseridos com sucesso!');
      console.log('Resultado da inserção:', result);
    } catch (error) {
      setMessage(`Erro ao inserir: ${error.message}`);
      console.error('Erro:', error);
    }
    setLoading(false);
  };

  const testSelect = async () => {
    setLoading(true);
    try {
      // Exemplo de seleção
      const data = await supabaseUtils.select('test_table', {}, { limit: 10 });
      setTestData(data);
      setMessage(`${data.length} registros encontrados`);
    } catch (error) {
      setMessage(`Erro ao buscar: ${error.message}`);
      console.error('Erro:', error);
    }
    setLoading(false);
  };

  const getStatusColor = () => {
    switch (connectionStatus) {
      case 'connected': return 'text-green-600';
      case 'error': return 'text-red-600';
      default: return 'text-yellow-600';
    }
  };

  const getStatusIcon = () => {
    switch (connectionStatus) {
      case 'connected': return '✅';
      case 'error': return '❌';
      default: return '🔄';
    }
  };

  return (
    <div className="max-w-4xl mx-auto p-6 bg-white rounded-lg shadow-lg">
      <h2 className="text-2xl font-bold mb-6 text-center">Teste de Conexão Supabase</h2>
      
      {/* Status da Conexão */}
      <div className="mb-6 p-4 border rounded-lg">
        <h3 className="text-lg font-semibold mb-2">Status da Conexão</h3>
        <div className={`flex items-center space-x-2 ${getStatusColor()}`}>
          <span className="text-2xl">{getStatusIcon()}</span>
          <span className="font-medium">
            {connectionStatus === 'testing' ? 'Testando conexão...' : 
             connectionStatus === 'connected' ? 'Conectado ao Supabase' : 
             'Erro na conexão'}
          </span>
        </div>
        {message && (
          <p className="mt-2 text-sm text-gray-600">{message}</p>
        )}
      </div>

      {/* Controles de Teste */}
      <div className="mb-6 space-y-4">
        <h3 className="text-lg font-semibold">Operações de Teste</h3>
        <div className="flex space-x-4">
          <button
            onClick={checkConnection}
            disabled={loading}
            className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 disabled:opacity-50"
          >
            {loading ? 'Testando...' : 'Testar Conexão'}
          </button>
          <button
            onClick={testInsert}
            disabled={loading || connectionStatus !== 'connected'}
            className="px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600 disabled:opacity-50"
          >
            Inserir Teste
          </button>
          <button
            onClick={testSelect}
            disabled={loading || connectionStatus !== 'connected'}
            className="px-4 py-2 bg-purple-500 text-white rounded hover:bg-purple-600 disabled:opacity-50"
          >
            Buscar Dados
          </button>
        </div>
      </div>

      {/* Dados de Teste */}
      {testData.length > 0 && (
        <div className="mb-6">
          <h3 className="text-lg font-semibold mb-2">Dados Encontrados</h3>
          <div className="bg-gray-100 p-4 rounded-lg max-h-60 overflow-y-auto">
            <pre className="text-sm">
              {JSON.stringify(testData, null, 2)}
            </pre>
          </div>
        </div>
      )}

      {/* Informações de Configuração */}
      <div className="border-t pt-4">
        <h3 className="text-lg font-semibold mb-2">Configuração</h3>
        <div className="text-sm text-gray-600 space-y-1">
          <p><strong>Supabase URL:</strong> {import.meta.env.VITE_SUPABASE_URL || 'Não configurado'}</p>
          <p><strong>Anon Key:</strong> {import.meta.env.VITE_SUPABASE_ANON_KEY ? '***configurado***' : 'Não configurado'}</p>
        </div>
        
        {(!import.meta.env.VITE_SUPABASE_URL || !import.meta.env.VITE_SUPABASE_ANON_KEY) && (
          <div className="mt-4 p-4 bg-yellow-100 border border-yellow-400 rounded-lg">
            <p className="text-yellow-800 text-sm">
              <strong>Configuração Necessária:</strong> Configure as variáveis VITE_SUPABASE_URL e VITE_SUPABASE_ANON_KEY no arquivo .env
            </p>
          </div>
        )}
      </div>
    </div>
  );
};

export default SupabaseTest;