import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PagesComponent } from './pages.component';
import { VentasComponent } from './ventas/ventas.component';
import { CrearClienteComponent } from './crear-cliente/crear-cliente.component';
import { CrearProductoComponent } from './crear-producto/crear-producto.component';
import { DatosClientesComponent } from './datos-clientes/datos-clientes.component';
import { DatosProductosComponent } from './datos-productos/datos-productos.component';
import { HistorialVentasComponent } from './historial-ventas/historial-ventas.component';


const routes: Routes = [
    {
        path: 'dashboard', component: PagesComponent, 
        children:[
            {path: 'ventas', component:VentasComponent },
            {path: 'crear-cliente', component:CrearClienteComponent },
            {path: 'crear-prducto', component:CrearProductoComponent },
            {path: 'datos-clientes', component:DatosClientesComponent },
            {path: 'datos-productos', component:DatosProductosComponent },
            {path: 'historial-ventas', component:HistorialVentasComponent }
            
        ]
    }
];

@NgModule({
  imports: [RouterModule.forChild(routes)], // Usando rutas hijas
  exports: [RouterModule]
})
export class PagesRoutingModule { }
