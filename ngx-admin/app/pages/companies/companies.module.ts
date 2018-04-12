import { NgModule } from '@angular/core';
import { Ng2SmartTableModule } from 'ng2-smart-table';

import { ThemeModule } from '../../@theme/theme.module';
import { CompaniesComponent } from './companies.component';
import { NotificationsComponent } from './notification.component';
import { CompaniesRoutingModule, routedComponents } from './companies-routing.module';
import { ToasterModule } from 'angular2-toaster';

@NgModule({
  imports: [
    ThemeModule,
    CompaniesRoutingModule,
    Ng2SmartTableModule,
    ToasterModule,
  ],
  declarations: [
   ...routedComponents,
  ],
  providers: [
    NotificationsComponent,
  ],
})
export class CompaniesModule { }
