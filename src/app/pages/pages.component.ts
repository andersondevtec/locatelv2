import { Component } from '@angular/core';
import { ClientesService } from '../services/clientes.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-pages',
  templateUrl: './pages.component.html',
  styleUrls: ['./pages.component.css']
})
export class PagesComponent {

  constructor(public clientesService: ClientesService, public router:Router){
    console.log(clientesService.menu);

  }

  logout(){
    this.router.navigateByUrl('/login');

  }

}
