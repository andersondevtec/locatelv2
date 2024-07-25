import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';

import { PagesComponent } from './pages.component';
import { LoginComponent } from './login/login.component';
import { CrearClienteComponent } from './crear-cliente/crear-cliente.component';
import { CrearProductoComponent } from './crear-producto/crear-producto.component';
import { DatosClientesComponent } from './datos-clientes/datos-clientes.component';
import { DatosProductosComponent } from './datos-productos/datos-productos.component';
import { VentasComponent } from './ventas/ventas.component';
import { HistorialVentasComponent } from './historial-ventas/historial-ventas.component';




@NgModule({
  declarations: [
    PagesComponent,
    LoginComponent,
    CrearClienteComponent,
    CrearProductoComponent,
    DatosClientesComponent,
    DatosProductosComponent,
    VentasComponent,
    HistorialVentasComponent
  ],
  imports: [
    CommonModule,
    RouterModule,
    FormsModule
  ]
})
export class PagesModule { }
