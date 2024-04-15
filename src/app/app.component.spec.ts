// app.component.spec.ts

import { TestBed, ComponentFixture } from '@angular/core/testing';
import { RouterTestingModule } from '@angular/router/testing';
import { AppComponent } from './app.component';

describe('AppComponent', () => {
  let component: AppComponent;
  let fixture: ComponentFixture<AppComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [AppComponent],
      imports: [RouterTestingModule]
    }).compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AppComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create the app', () => {
    expect(component).toBeTruthy();
  });

  it('should render the navbar', () => {
    const navbarElement = fixture.nativeElement.querySelector('.navbar');
    expect(navbarElement).toBeTruthy();
  });

  it('should render the navbar brand with correct text', () => {
    const navbarBrandElement = fixture.nativeElement.querySelector('.navbar-brand');
    expect(navbarBrandElement.textContent).toContain('DevOps Project');
  });

  it('should contain Products link in the navbar', () => {
    const productsLinkElement = fixture.nativeElement.querySelector('[routerLink="/products"]');
    expect(productsLinkElement).toBeTruthy();
  });

  it('should contain Contact link in the navbar', () => {
    const contactLinkElement = fixture.nativeElement.querySelector('[routerLink="/contact"]');
    expect(contactLinkElement).toBeTruthy();
  });
});


