import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { apiServer } from '../apiServer'; 

import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ClientesService {

  url = apiServer.url;

  

  // propiedades del menú
  public menu: any = [

    {
      titulo: 'Clientes',
      icono: 'mdi mdi-account',
      submenu: [
        { titulo: 'Crear cliente', url: '/dashboard/crear-cliente' },
        { titulo: 'Datos del cliente', url: '/dashboard/datos-clientes' }
      ]
    },

    {
      titulo: 'Productos',
      icono: 'mdi mdi-chemical-weapon',
      submenu: [
        { titulo: 'Crear producto', url: '/dashboard/crear-prducto' },
        { titulo: 'Información de productos', url: '/dashboard/datos-productos' }
        
      ]
    },

    {
      titulo: 'Ventas',
      icono: 'mdi mdi-gauge',
      submenu: [
        { titulo: 'Historial de ventas', url: '/dashboard/historial-ventas' }
        
      ]
    }

  ];

  constructor(private http: HttpClient) { }

  postMethod( url: any, body: any):Observable <any>{
    return this.http.post(`${this.url}${url}`,body);//llamar la urls de manera dinámica - llamar endpoint  del api server

  }

  getMethod( url: any ):Observable <any>{
    return this.http.get (`${this.url}${url}`);//llamar la urls de manera dinámica - llamar endpoint del api server

  }

  
}


