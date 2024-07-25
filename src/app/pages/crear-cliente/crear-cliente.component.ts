import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { ClientesService } from 'src/app/services/clientes.service';

@Component({
  selector: 'app-crear-cliente',
  templateUrl: './crear-cliente.component.html',
  styleUrls: ['./crear-cliente.component.css']
})
export class CrearClienteComponent {

  clientes: any = {};

  constructor(public clientesService: ClientesService,public router: Router) { }
  
  Cliente() {
    
    //Llamar formularios
    let formData = new FormData();
    formData.append('Nombre', this.clientes.Nombre);
    formData.append('Cedula', this.clientes.Cedula);
    formData.append('Direccion', this.clientes.Direccion);
    formData.append('Telefono', this.clientes.Telefono);
    formData.append('Email', this.clientes.Email)

    this.clientesService.postMethod('cliente.php', formData).subscribe(
      (event: any) => {
        console.log(event);
        if (event.status == 'success'){
          this.router.navigate(['/dashboard/datos-clientes']);

        }
      })
  }

}
