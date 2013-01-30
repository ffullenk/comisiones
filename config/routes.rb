Comisiones::Application.routes.draw do



  resources :clientes


  resources :catalogos


  devise_for :empresas

  resources :productos do
    resources :pedidos
  end
  resources :pedidos
  devise_for :vendedors

  root :to => "home#index"
  match '/auth/:provider/callback' => 'authentications#create'
 #Rutas Empresas
  match "/empresas/:empresa_id/productos" =>"productos#productos_empresa", :as => "productos_empresa"
  match "/empresas/:empresa_id/productos/:producto_id" =>"productos#show_empresa", :as => "producto_empresa"
  match "/empresas/:empresa_id/pedidos" =>"pedidos#pedidos_empresa", :as => "pedidos_empresa"
  match "/empresas/:empresa_id/productos/:producto_id/pedidos/:pedido_id" =>"pedidos#show_empresa", :as => "pedido_empresa"
  match "/empresas/:empresa_id/productos/:producto_id/pedidos/:pedido_id/confirmar" =>"pedidos#confirmar_pedido_empresa", :as => "confirmar_pedido_empresa", :method=>"post"

  #match "/empresas/:empresa_id/pedidos/:pedido_id" =>"pedidos#show_empresa", :as => "pedido_empresa"
  #Fin Rutas Empresas


  #Rutas Vendedores
  match "/vendedors/:vendedor_id/catalogo" =>"catalogos#catalogo_vendedor", :as => "catalogo_vendedor"
  match "/vendedors/:vendedor_id/pedidos" =>"pedidos#pedidos_vendedor", :as => "pedidos_vendedor"
  match "/vendedors/:vendedor_id/pedidos/:pedido_id" =>"pedidos#show_vendedor", :as => "pedido_vendedor"
  match "/vendedors/:vendedor_id/productos/:producto_id/agregar" =>"catalogos#agregar_producto_catalogo_vendedor", :as => "agregar_producto_catalogo_vendedor"
  match "/vendedors/:vendedor_id/pedidos/:pedido_id/agregarcliente" =>"clientes#agregar_cliente_pedido", :as => "agregar_cliente_pedido"
  match "/vendedors/:vendedor_id/comisiones" =>"home#comisiones_vendedor", :as => "comisiones_vendedor"
  match "/vendedors/:vendedor_id" =>"vendedores#miperfil", :as => "miperfil_vendedor"
  #Fin Rutas Vendedores
end
