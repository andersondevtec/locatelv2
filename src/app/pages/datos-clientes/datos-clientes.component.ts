 import { Component } from '@angular/core';
import { ClientesService } from 'src/app/services/clientes.service';

@Component({
  selector: 'app-datos-clientes',
  templateUrl: './datos-clientes.component.html',
  styleUrls: ['./datos-clientes.component.css']
})
export class DatosClientesComponent {

  clientes: any ={};

  constructor(private clientesService: ClientesService){
    
    this.obtenerClientes();

  }

  obtenerClientes() {
    console.log('Antes de llamar al servicio');
    this.clientesService.getMethod('ObtenerClientes.php').subscribe(
      (data) => {
        console.log('Datos recibidos:', data);
        this.clientes = data.document;
        console.log('Clientes:', this.clientes);
      },
      (error) => {
        console.error('Error al obtener clientes:', error);
      }
    );
  }
  

}
