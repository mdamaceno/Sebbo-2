# Menu
Menu.create([name: 'Cadastros', icon: 'fa-bars', active: 1])
Menu.create([name: 'Gerenciar Site', icon: 'fa-desktop', active: 1])
Menu.create([name: 'Configurações', icon: 'fa-cog', active: 1])
Menu.create([name: 'Suporte', icon: 'fa-info', active: 1])

# Submenu
Submenu.create([name: 'Clientes', route: 'clientes', active: 1, menu_id: 1])
Submenu.create([name: 'Categorias de Produtos', route: 'categorias', active: 1, menu_id: 1])
Submenu.create([name: 'Subcategorias de Produtos', route: 'subcategorias', active: 1, menu_id: 1])
Submenu.create([name: 'Produtos', route: 'produtos', active: 1, menu_id: 1])
Submenu.create([name: 'Pedidos', route: 'pedidos', active: 1, menu_id: 1])
Submenu.create([name: 'Home', route: 'home', active: 1, menu_id: 2])
Submenu.create([name: 'Páginas', route: 'paginas', active: 1, menu_id: 2])
Submenu.create([name: 'Usuários', route: 'usuarios', active: 1, menu_id: 3])

# Pages
Page.create([title: 'Quem somos', description: 'Lorem ipsum dolor sit amet.', active: 1])
Page.create([title: 'Política de Privacidade', description: 'Lorem ipsum dolor sit amet.', active: 1])
Page.create([title: 'Termos de uso', description: 'Lorem ipsum dolor sit amet.', active: 1])
Page.create([title: 'Entrega', description: 'Lorem ipsum dolor sit amet.', active: 1])
Page.create([title: 'Trocas & Devoluções', description: 'Lorem ipsum dolor sit amet.', active: 1])
Page.create([title: 'Fale Conosco', description: 'Lorem ipsum dolor sit amet.', active: 1])

# Categories
Category.create([name: 'Literatura Infanto-juvenil', active: 1])
Category.create([name: 'Literatura Estrangeira', active: 1])
Category.create([name: 'Literatura Nacional', active: 1])
Category.create([name: 'Ficção Científica', active: 1])
Category.create([name: 'Informática', active: 1])
Category.create([name: 'Romance', active: 1])
Category.create([name: 'Administração', active: 1])
Category.create([name: 'Agropecuária', active: 1])
Category.create([name: 'Artes', active: 1])
Category.create([name: 'Autoajuda', active: 1])
Category.create([name: 'Ciência Biológicas', active: 1])
Category.create([name: 'Cursos e Idiomas', active: 1])
Category.create([name: 'Didático', active: 1])
Category.create([name: 'Economia', active: 1])
Category.create([name: 'Direito', active: 1])
Category.create([name: 'Medicina', active: 1])
Category.create([name: 'Gastronomia', active: 1])
Category.create([name: 'Esoterismo', active: 1])
Category.create([name: 'Geografia', active: 1])
Category.create([name: 'História', active: 1])
Category.create([name: 'Religião', active: 1])
Category.create([name: 'Esporte e Lazer', active: 1])
Category.create([name: 'Dicionário', active: 1])

# Users
u = User.new
u.firstname = 'Marco'
u.lastname = 'Damaceno'
u.phone1 = '3232361206'
u.phone2 = '3285191515'
u.doc1 = '11754643760'
u.doc2 = '17166173'
u.active = 1
u.group = 0
u.email = 'maadamaceno@gmail.com'
u.password = '123456789'
u.save!
