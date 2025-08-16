from flask import Flask, render_template, request, jsonify, redirect, url_for, flash, session
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from datetime import datetime, timedelta
import os
import json
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)
app.config['SECRET_KEY'] = 'spark-hq1-inventory-secret-key'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///inventory.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)
migrate = Migrate(app, db)

# Define models inline to avoid circular imports
class User(db.Model):
    __tablename__ = 'users'
    
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    password_hash = db.Column(db.String(128), nullable=False)
    is_admin = db.Column(db.Boolean, default=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)

class ItemsAvSpark(db.Model):
    __tablename__ = 'items_av_spark'
    
    id = db.Column(db.Integer, primary_key=True)
    itens = db.Column(db.String(200))  # ITENS
    modelo = db.Column(db.String(200))  # MODELO
    tag = db.Column(db.String(100))  # Tag
    serial = db.Column(db.String(100))  # Serial
    marca = db.Column(db.String(100))  # Marca
    valor = db.Column(db.Float)  # Valor
    data_compra = db.Column(db.Date)  # Data de compra
    fornecedor = db.Column(db.String(200))  # Fornecedor
    po = db.Column(db.String(100))  # PO
    uso = db.Column(db.String(200))  # USO
    qtd = db.Column(db.Integer, default=1)  # QTD
    avenue = db.Column(db.String(200))  # AVENUE
    street = db.Column(db.String(200))  # STREET
    owner = db.Column(db.String(200))  # OWNER
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

class ItemsAvHq1(db.Model):
    __tablename__ = 'items_av_hq1'
    
    id = db.Column(db.Integer, primary_key=True)
    prateleira = db.Column(db.String(100))  # Prateleira
    itens = db.Column(db.String(200))  # Itens 
    modelo = db.Column(db.String(200))  # Modelo
    tag = db.Column(db.String(100))  # Tag
    serial = db.Column(db.String(100))  # Serial
    marca = db.Column(db.String(100))  # Marca
    comprado_em = db.Column(db.Date)  # Comprado em
    qty_unit = db.Column(db.String(200))  # QTY (just f UNIT (just)
    custo = db.Column(db.Float)  # Custo
    end_of_life = db.Column(db.Date)  # End of Life
    numero_pedido = db.Column(db.String(100))  # Número do pedido
    fornecedor = db.Column(db.String(200))  # Fornecedor
    local = db.Column(db.String(200))  # Local
    uso = db.Column(db.String(200))  # Uso:
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

class TechstopHq1(db.Model):
    __tablename__ = 'techstop_hq1'
    
    id = db.Column(db.Integer, primary_key=True)
    itens = db.Column(db.String(200))  # Itens 
    modelo = db.Column(db.String(200))  # Modelo
    tag = db.Column(db.String(100))  # Tag
    serial = db.Column(db.String(100))  # Serial
    marca = db.Column(db.String(100))  # Marca
    comprado_em = db.Column(db.Date)  # Comprado em
    qty_unit = db.Column(db.String(200))  # QTY (just f UNIT (just)
    custo = db.Column(db.Float)  # Custo
    end_of_life = db.Column(db.Date)  # End of Life
    numero_pedido = db.Column(db.String(100))  # Número do pedido
    fornecedor = db.Column(db.String(200))  # Fornecedor
    local = db.Column(db.String(200))  # Local
    uso = db.Column(db.String(200))  # Uso:
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

class Hq18th(db.Model):
    __tablename__ = 'hq1_8th'
    
    id = db.Column(db.Integer, primary_key=True)
    itens = db.Column(db.String(200))  # Itens 
    modelo = db.Column(db.String(200))  # Modelo
    tag = db.Column(db.String(100))  # Tag
    serial = db.Column(db.String(100))  # Serial
    marca = db.Column(db.String(100))  # Marca
    qtd = db.Column(db.Integer, default=1)  # Qtd.
    valor = db.Column(db.Float)  # Valor
    data_compra = db.Column(db.Date)  # Data de compra
    fornecedor = db.Column(db.String(200))  # Fornecedor
    po = db.Column(db.String(100))  # PO
    uso = db.Column(db.String(200))  # USO
    prateleira = db.Column(db.String(100))  # Prateleira
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

class TvsMonitoresSpark(db.Model):
    __tablename__ = 'tvs_monitores_spark'
    
    id = db.Column(db.Integer, primary_key=True)
    # Campos não nomeados conforme especificado no YAML
    c1 = db.Column(db.String(200))  # Unnamed: 0
    c2 = db.Column(db.String(200))  # Unnamed: 1
    c3 = db.Column(db.String(200))  # Unnamed: 2
    c4 = db.Column(db.String(200))  # Unnamed: 3
    c5 = db.Column(db.String(200))  # Unnamed: 4
    c6 = db.Column(db.String(200))  # Unnamed: 5
    c7 = db.Column(db.String(200))  # Unnamed: 6
    c8 = db.Column(db.String(200))  # Unnamed: 7
    c9 = db.Column(db.String(200))  # Unnamed: 8
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

class VendasSpark(db.Model):
    __tablename__ = 'vendas_spark'
    
    id = db.Column(db.Integer, primary_key=True)
    item_estoque = db.Column(db.String(200))  # Item em estoque
    quantidade = db.Column(db.Integer)  # quantidade
    estado_item = db.Column(db.String(100))  # Estado do item
    tag_serial = db.Column(db.String(100))  # Tag ou serial 
    status = db.Column(db.String(100))  # Status
    observacao = db.Column(db.Text)  # Observação
    total_itens = db.Column(db.Integer)  # TOTAL DE ITENS
    unnamed_7 = db.Column(db.String(200))  # Unnamed: 7
    numero_ativo = db.Column(db.String(100))  # Número do Ativo
    data_aquisicao = db.Column(db.Date)  # Data de Aquisição
    valor_compra_unit = db.Column(db.Float)  # Valor Compra Unitário
    valor_contabil = db.Column(db.Float)  # Valor Contábil
    unnamed_12 = db.Column(db.String(200))  # Unnamed: 12
    valor_venda = db.Column(db.Float)  # Valor de Venda
    unnamed_14 = db.Column(db.String(200))  # Unnamed: 14
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

class LixoEletronicoHq1(db.Model):
    __tablename__ = 'lixo_eletronico_hq1'
    
    id = db.Column(db.Integer, primary_key=True)
    item_estoque = db.Column(db.String(200))  # Item em estoque
    quantidade = db.Column(db.Integer)  # Quantidade
    estado_item = db.Column(db.String(100))  # Estado do item
    tag_serial = db.Column(db.String(100))  # Tag ou serial 
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

class InventarioHq1Oficial(db.Model):
    __tablename__ = 'inventario_hq1_oficial'
    
    id = db.Column(db.Integer, primary_key=True)
    check = db.Column(db.Boolean, default=False)  # Check
    prateleira = db.Column(db.String(100))  # Prateleira
    responsavel = db.Column(db.String(200))  # Responsável
    itens = db.Column(db.String(200))  # Itens 
    modelo = db.Column(db.String(200))  # Modelo
    tag = db.Column(db.String(100))  # Tag
    serial = db.Column(db.String(100))  # Serial
    marca = db.Column(db.String(100))  # Marca
    tag_1 = db.Column(db.String(100))  # Tag.1
    unnamed_9 = db.Column(db.String(200))  # Unnamed: 9
    unnamed_10 = db.Column(db.String(200))  # Unnamed: 10
    unnamed_11 = db.Column(db.String(200))  # Unnamed: 11
    unnamed_12 = db.Column(db.String(200))  # Unnamed: 12
    unnamed_13 = db.Column(db.String(200))  # Unnamed: 13
    unnamed_14 = db.Column(db.String(200))  # Unnamed: 14
    unnamed_15 = db.Column(db.String(200))  # Unnamed: 15
    comprado_em = db.Column(db.Date)  # Comprado em
    qty_unit = db.Column(db.String(200))  # QTY (just f UNIT (just
    custo = db.Column(db.Float)  # Custo
    end_of_life = db.Column(db.Date)  # End of Life
    numero_pedido = db.Column(db.String(100))  # Número do pedido
    fornecedor = db.Column(db.String(200))  # Fornecedor
    local = db.Column(db.String(200))  # Local
    uso = db.Column(db.String(200))  # Uso:
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

class Movimentacao(db.Model):
    __tablename__ = 'movimentacoes'
    
    id = db.Column(db.Integer, primary_key=True)
    data_hora = db.Column(db.DateTime, default=datetime.utcnow)  # Data/Hora
    tipo = db.Column(db.String(20), nullable=False)  # Tipo (Entrada/Saída)
    origem_pagina = db.Column(db.String(200))  # Origem (aba/página)
    itens = db.Column(db.String(200))  # Item (nome/modelo)
    tag = db.Column(db.String(100))  # Tag
    serial = db.Column(db.String(100))  # Serial
    quantidade = db.Column(db.Integer)  # Quantidade (+/-)
    responsavel = db.Column(db.String(200))  # Responsável
    local = db.Column(db.String(200))  # Local/Prateleira
    observacao = db.Column(db.Text)  # Observação
    documento = db.Column(db.String(100))  # Documento/PO (se aplicável)

@app.route('/')
def index():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    return redirect(url_for('dashboard'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        user = User.query.filter_by(username=username).first()
        if user and check_password_hash(user.password_hash, password):
            session['user_id'] = user.id
            session['username'] = user.username
            return redirect(url_for('dashboard'))
        else:
            flash('Usuário ou senha inválidos', 'error')
    
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login'))

@app.route('/dashboard')
def dashboard():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    
    # Calculate dashboard metrics
    total_items = (ItemsAvSpark.query.count() + 
                  ItemsAvHq1.query.count() + 
                  TechstopHq1.query.count() + 
                  Hq18th.query.count())
    
    # Entries and exits in last 30 days
    thirty_days_ago = datetime.now() - timedelta(days=30)
    entries_30d = Movimentacao.query.filter(
        Movimentacao.tipo == 'Entrada',
        Movimentacao.data_hora >= thirty_days_ago
    ).count()
    
    exits_30d = Movimentacao.query.filter(
        Movimentacao.tipo == 'Saída',
        Movimentacao.data_hora >= thirty_days_ago
    ).count()
    
    # Items close to end of life (next 90 days)
    ninety_days_from_now = datetime.now() + timedelta(days=90)
    items_eol = (ItemsAvHq1.query.filter(
        ItemsAvHq1.end_of_life.isnot(None),
        ItemsAvHq1.end_of_life <= ninety_days_from_now
    ).count() + TechstopHq1.query.filter(
        TechstopHq1.end_of_life.isnot(None),
        TechstopHq1.end_of_life <= ninety_days_from_now
    ).count())
    
    stats = {
        'total_items': total_items,
        'entries_30d': entries_30d,
        'exits_30d': exits_30d,
        'items_eol': items_eol
    }
    
    return render_template('dashboard.html', stats=stats)

@app.route('/inventario/av-spark')
def inventario_av_spark():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    items = ItemsAvSpark.query.all()
    return render_template('inventario_av_spark.html', items=items)

@app.route('/inventario/av-hq1')
def inventario_av_hq1():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    items = ItemsAvHq1.query.all()
    return render_template('inventario_av_hq1.html', items=items)

@app.route('/inventario/techstop-hq1')
def inventario_techstop_hq1():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    items = TechstopHq1.query.all()
    return render_template('inventario_techstop_hq1.html', items=items)

@app.route('/inventario/hq1-8th')
def inventario_hq1_8th():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    items = Hq18th.query.all()
    return render_template('inventario_hq1_8th.html', items=items)

@app.route('/inventario/tvs-monitores-spark')
def inventario_tvs_monitores():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    items = TvsMonitoresSpark.query.all()
    return render_template('inventario_tvs_monitores.html', items=items)

@app.route('/vendas-spark')
def vendas_spark():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    items = VendasSpark.query.all()
    return render_template('vendas_spark.html', items=items)

@app.route('/lixo-eletronico')
def lixo_eletronico():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    items = LixoEletronicoHq1.query.all()
    return render_template('lixo_eletronico.html', items=items)

@app.route('/inventario-oficial')
def inventario_oficial():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    items = InventarioHq1Oficial.query.all()
    return render_template('inventario_oficial.html', items=items)

@app.route('/entrada-estoque', methods=['GET', 'POST'])
def entrada_estoque():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    
    if request.method == 'POST':
        data = request.get_json() if request.is_json else request.form
        
        barcode = data.get('barcode')
        origem_pagina = data.get('origem_pagina')
        quantidade = int(data.get('quantidade', 1))
        responsavel = data.get('responsavel', session.get('username'))
        local = data.get('local', '')
        observacao = data.get('observacao', '')
        
        # Process barcode entry
        result = process_barcode_entry(barcode, origem_pagina, quantidade, responsavel, local, observacao)
        
        if request.is_json:
            return jsonify(result)
        else:
            if result['success']:
                flash(result['message'], 'success')
            else:
                flash(result['message'], 'error')
            return redirect(url_for('entrada_estoque'))
    
    return render_template('entrada_estoque.html')

@app.route('/saida-estoque', methods=['GET', 'POST'])
def saida_estoque():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    
    if request.method == 'POST':
        data = request.get_json() if request.is_json else request.form
        
        barcode = data.get('barcode')
        origem_pagina = data.get('origem_pagina')
        quantidade = int(data.get('quantidade', 1))
        responsavel = data.get('responsavel', session.get('username'))
        destino = data.get('destino', '')
        observacao = data.get('observacao', '')
        
        # Process barcode exit
        result = process_barcode_exit(barcode, origem_pagina, quantidade, responsavel, destino, observacao)
        
        if request.is_json:
            return jsonify(result)
        else:
            if result['success']:
                flash(result['message'], 'success')
            else:
                flash(result['message'], 'error')
            return redirect(url_for('saida_estoque'))
    
    return render_template('saida_estoque.html')

@app.route('/movimentacoes')
def movimentacoes():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    
    page = request.args.get('page', 1, type=int)
    per_page = 50
    
    movimentacoes = Movimentacao.query.order_by(Movimentacao.data_hora.desc()).paginate(
        page=page, per_page=per_page, error_out=False
    )
    
    return render_template('movimentacoes.html', movimentacoes=movimentacoes)

@app.route('/relatorios')
def relatorios():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    return render_template('relatorios.html')

@app.route('/api/search-item')
def api_search_item():
    if 'user_id' not in session:
        return jsonify({'error': 'Unauthorized'}), 401
    
    barcode = request.args.get('barcode', '')
    origem = request.args.get('origem', '')
    
    if not barcode:
        return jsonify({'error': 'Código de barras é obrigatório'}), 400
    
    items = search_item_by_barcode(barcode, origem)
    return jsonify({'items': items})

def process_barcode_entry(barcode, origem_pagina, quantidade, responsavel, local, observacao):
    try:
        # Search for existing item
        items = search_item_by_barcode(barcode, origem_pagina)
        
        if items:
            # Update existing item quantity
            item = items[0]  # Take first match
            model_class = get_model_class(origem_pagina)
            db_item = model_class.query.get(item['id'])
            
            if hasattr(db_item, 'qtd'):
                db_item.qtd = (db_item.qtd or 0) + quantidade
            elif hasattr(db_item, 'quantidade'):
                db_item.quantidade = (db_item.quantidade or 0) + quantidade
            
            db.session.commit()
            
            # Record movement
            movimentacao = Movimentacao(
                tipo='Entrada',
                origem_pagina=origem_pagina,
                itens=db_item.itens if hasattr(db_item, 'itens') else '',
                tag=barcode if hasattr(db_item, 'tag') else '',
                serial=barcode if hasattr(db_item, 'serial') else '',
                quantidade=quantidade,
                responsavel=responsavel,
                local=local,
                observacao=observacao
            )
            db.session.add(movimentacao)
            db.session.commit()
            
            return {'success': True, 'message': f'Item atualizado com sucesso. Nova quantidade: {db_item.qtd if hasattr(db_item, "qtd") else db_item.quantidade}'}
        
        else:
            return {'success': False, 'message': 'Item não encontrado. Cadastre o item primeiro.'}
            
    except Exception as e:
        db.session.rollback()
        return {'success': False, 'message': f'Erro ao processar entrada: {str(e)}'}

def process_barcode_exit(barcode, origem_pagina, quantidade, responsavel, destino, observacao):
    try:
        # Search for existing item
        items = search_item_by_barcode(barcode, origem_pagina)
        
        if not items:
            return {'success': False, 'message': 'Item não encontrado'}
        
        item = items[0]
        model_class = get_model_class(origem_pagina)
        db_item = model_class.query.get(item['id'])
        
        # Check current quantity
        current_qty = 0
        if hasattr(db_item, 'qtd'):
            current_qty = db_item.qtd or 0
        elif hasattr(db_item, 'quantidade'):
            current_qty = db_item.quantidade or 0
        
        if current_qty < quantidade:
            return {'success': False, 'message': f'Quantidade insuficiente em estoque. Disponível: {current_qty}'}
        
        # Update quantity
        if hasattr(db_item, 'qtd'):
            db_item.qtd = current_qty - quantidade
        elif hasattr(db_item, 'quantidade'):
            db_item.quantidade = current_qty - quantidade
        
        db.session.commit()
        
        # Record movement
        movimentacao = Movimentacao(
            tipo='Saída',
            origem_pagina=origem_pagina,
            itens=db_item.itens if hasattr(db_item, 'itens') else '',
            tag=barcode if hasattr(db_item, 'tag') else '',
            serial=barcode if hasattr(db_item, 'serial') else '',
            quantidade=-quantidade,
            responsavel=responsavel,
            local=destino,
            observacao=observacao
        )
        db.session.add(movimentacao)
        db.session.commit()
        
        new_qty = current_qty - quantidade
        return {'success': True, 'message': f'Saída registrada com sucesso. Quantidade restante: {new_qty}'}
        
    except Exception as e:
        db.session.rollback()
        return {'success': False, 'message': f'Erro ao processar saída: {str(e)}'}

def search_item_by_barcode(barcode, origem_pagina=None):
    items = []
    
    models_to_search = []
    if origem_pagina:
        model_class = get_model_class(origem_pagina)
        if model_class:
            models_to_search = [model_class]
    else:
        models_to_search = [ItemsAvSpark, ItemsAvHq1, TechstopHq1, Hq18th]
    
    for model in models_to_search:
        # Search by tag
        if hasattr(model, 'tag'):
            results = model.query.filter(model.tag == barcode).all()
            for item in results:
                items.append({
                    'id': item.id,
                    'model': model.__name__,
                    'itens': getattr(item, 'itens', ''),
                    'modelo': getattr(item, 'modelo', ''),
                    'tag': getattr(item, 'tag', ''),
                    'serial': getattr(item, 'serial', ''),
                    'marca': getattr(item, 'marca', ''),
                    'qtd': getattr(item, 'qtd', None) or getattr(item, 'quantidade', None)
                })
        
        # Search by serial
        if hasattr(model, 'serial'):
            results = model.query.filter(model.serial == barcode).all()
            for item in results:
                items.append({
                    'id': item.id,
                    'model': model.__name__,
                    'itens': getattr(item, 'itens', ''),
                    'modelo': getattr(item, 'modelo', ''),
                    'tag': getattr(item, 'tag', ''),
                    'serial': getattr(item, 'serial', ''),
                    'marca': getattr(item, 'marca', ''),
                    'qtd': getattr(item, 'qtd', None) or getattr(item, 'quantidade', None)
                })
    
    return items

def get_model_class(origem_pagina):
    model_map = {
        'Itens A&V Spark': ItemsAvSpark,
        'Itens A&V HQ1': ItemsAvHq1,
        'Techstop itens HQ1': TechstopHq1,
        'HQ1 8th': Hq18th,
        'TVs e Monitores (Spark)': TvsMonitoresSpark,
        'Lixo-Eletrônico HQ-1': LixoEletronicoHq1,
        'Inventário HQ1 (oficial em progresso)': InventarioHq1Oficial
    }
    return model_map.get(origem_pagina)

@app.context_processor
def inject_user():
    return dict(current_user=session.get('username'))

if __name__ == '__main__':
    with app.app_context():
        db.create_all()
        
        # Create default admin user if not exists
        if not User.query.filter_by(username='admin').first():
            admin = User(
                username='admin',
                password_hash=generate_password_hash('admin123'),
                is_admin=True
            )
            db.session.add(admin)
            db.session.commit()
            print("Default admin user created: admin/admin123")
    
    app.run(debug=True, host='0.0.0.0', port=5000)