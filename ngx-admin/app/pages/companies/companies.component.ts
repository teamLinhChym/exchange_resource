import { Component } from '@angular/core';
import { LocalDataSource } from 'ng2-smart-table';
import { Http } from '@angular/http';
import { NotificationsComponent } from './notification.component';

@Component({
  providers: [NotificationsComponent],
  selector: 'ngx-smart-table',
  templateUrl: './companies.component.html',
  styles: [`
    nb-card {
      transform: translate3d(0, 0, 0);
    }
  `],
})
export class CompaniesComponent {
  constructor(private http: Http, private notification: NotificationsComponent) {
    this.getData();
  }

  companies: LocalDataSource = new LocalDataSource();
  settings = {
    add: {
      addButtonContent: '<i class="nb-plus"></i>',
      createButtonContent: '<i class="nb-checkmark"></i>',
      cancelButtonContent: '<i class="nb-close"></i>',
      confirmCreate:true,
    },
    edit: {
      editButtonContent: '<i class="nb-edit"></i>',
      saveButtonContent: '<i class="nb-checkmark"></i>',
      cancelButtonContent: '<i class="nb-close"></i>',
      confirmSave:true,
    },
    delete: {
      deleteButtonContent: '<i class="nb-trash"></i>',
      confirmDelete: true,
    },
    columns: {
      id: {
        title: 'ID',
        type: 'number',
      },
      name: {
        title: 'Name',
        type: 'string',
      },
      description: {
        title: 'description',
        type: 'string',
      },
      address: {
        title: 'address',
        type: 'string',
      },
      email: {
        title: 'E-mail',
        type: 'string',
      },
      phone: {
        title: 'Phone',
        type: 'string',
      },
    },
  };


  onDeleteConfirm(event): void {
    if (window.confirm('Are you sure you want to delete?')) {
      this.http.delete('http://localhost:3000/manager/companies/' + event.data.id).subscribe(
        res => {
          var bodyData = res.json();
          if (bodyData.status == "success"){
            this.showNotfication("success", bodyData.message);
            event.confirm.resolve(event.newData);
            this.getData();
          } else {
          debugger;
            this.showNotfication("error", bodyData.message);
          }
        }
      )
    } else {
      event.confirm.reject();
    }
  }
  private getData (){
    this.http.get('http://localhost:3000/manager/companies.json')
      .subscribe(res => {
        this.companies.load(res.json().data);
      });
  }

  onCreateConfirm(event): void {
    var data = {
      "name": event.newData.name,
      "description": event.newData.description,
      "address": event.newData.address,
      "email": event.newData.email,
      "phone": event.newData.phone,
    };

    this.http.post('http://localhost:3000/manager/companies/', data).subscribe(
      res => {
      var bodyData = res.json();
        if (bodyData.status == "success"){
          this.showNotfication("success", bodyData.message);
          event.confirm.resolve(event.newData);
          this.getData();
        } else {
        debugger;
          this.showNotfication("error", bodyData.message);
        }
      }
    );
  }

  onUpdateConfirm(event): void{
    var data = {
      "name": event.newData.name,
      "description": event.newData.description,
      "address": event.newData.address,
      "email": event.newData.email,
      "phone": event.newData.phone,
    };

    this.http.put('http://localhost:3000/manager/companies/' + event.newData.id, data).subscribe(
      res => {
        var bodyData = res.json();
        if (bodyData.status == "success"){
          this.showNotfication("success", bodyData.message);
          event.confirm.resolve(event.newData);
          this.getData();
        } else {
        debugger;
          this.showNotfication("error", bodyData.message);
        }
      }
    );
  }

  private showNotfication(type: string, message: string){
    this.notification.showToast(type, message);
  }
}
