//
//  ViewController.m
//  MasterMind
//
//  Created by Jorge Luis Perales on 29/01/15.
//  Copyright (c) 2015 Jorge Luis Perales. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.selBoton1.backgroundColor = UIColor.redColor;
    self.selBoton2.backgroundColor = UIColor.redColor;
    self.selBoton3.backgroundColor = UIColor.redColor;
    self.selBoton4.backgroundColor = UIColor.redColor;
    
    self.colorCount = 0;
    self.colorCount2 = 0;
    self.colorCount3 = 0;
    self.colorCount4 = 0;
    
    self.cuentaVistas = 0;
    
    self.viewProbar.hidden = YES; //Oculta segundo View
    
    self.correcto1.hidden = YES;
    self.correcto2.hidden = YES;
    self.correcto3.hidden = YES;
    self.correcto4.hidden = YES;
    
    [self coloresRandom];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)control:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.viewProbar.hidden = YES;
    } else {
        self.viewProbar.hidden = NO;
    }
}

- (IBAction)boton1:(UIButton *)sender {
    switch (self.colorCount) {
        case 0:
            sender.backgroundColor = UIColor.blackColor;
            break;
        case 1:
            sender.backgroundColor = UIColor.blueColor;
            break;
        case 2:
            sender.backgroundColor = UIColor.yellowColor;
            break;
        case 3:
            sender.backgroundColor = UIColor.greenColor;
            break;
        case 4:
            sender.backgroundColor = UIColor.grayColor;
            break;
        case 5:
            sender.backgroundColor = UIColor.redColor;
        default:
            break;
    }
    self.colorCount += 1;
    if (self.colorCount > 5) {
        self.colorCount = 0;
    }
}

- (IBAction)boton2:(UIButton *)sender {
    switch (self.colorCount2) {
        case 0:
            sender.backgroundColor = UIColor.blackColor;
            break;
        case 1:
            sender.backgroundColor = UIColor.blueColor;
            break;
        case 2:
            sender.backgroundColor = UIColor.yellowColor;
            break;
        case 3:
            sender.backgroundColor = UIColor.greenColor;
            break;
        case 4:
            sender.backgroundColor = UIColor.grayColor;
            break;
        case 5:
            sender.backgroundColor = UIColor.redColor;
        default:
            break;
    }
    self.colorCount2 += 1;
    if (self.colorCount2 > 5) {
        self.colorCount2 = 0;
    }
}

- (IBAction)boton3:(UIButton *)sender {
    switch (self.colorCount3) {
        case 0:
            sender.backgroundColor = UIColor.blackColor;
            break;
        case 1:
            sender.backgroundColor = UIColor.blueColor;
            break;
        case 2:
            sender.backgroundColor = UIColor.yellowColor;
            break;
        case 3:
            sender.backgroundColor = UIColor.greenColor;
            break;
        case 4:
            sender.backgroundColor = UIColor.grayColor;
            break;
        case 5:
            sender.backgroundColor = UIColor.redColor;
        default:
            break;
    }
    self.colorCount3 += 1;
    if (self.colorCount3 > 5) {
        self.colorCount3 = 0;
    }
}

- (IBAction)boton4:(UIButton *)sender {
    switch (self.colorCount4) {
        case 0:
            sender.backgroundColor = UIColor.blackColor;
            break;
        case 1:
            sender.backgroundColor = UIColor.blueColor;
            break;
        case 2:
            sender.backgroundColor = UIColor.yellowColor;
            break;
        case 3:
            sender.backgroundColor = UIColor.greenColor;
            break;
        case 4:
            sender.backgroundColor = UIColor.grayColor;
            break;
        case 5:
            sender.backgroundColor = UIColor.redColor;
        default:
            break;
    }
    self.colorCount4 += 1;
    if (self.colorCount4 > 5) {
        self.colorCount4 = 0;
    }
}

- (IBAction)botonIniciar:(UIButton *)sender {
    [self viewDidLoad];
    // Reiniciar la posicion del segmented control
}

- (IBAction)botonProbar:(UIButton *)sender {
    // Verificar error con colores iniciales
    // Después de comparar colores muestra cuadro rojo o cuadro blanco indicando resultado.
    if (self.selBoton1.backgroundColor == self.selBoton2.backgroundColor || self.selBoton1.backgroundColor == self.selBoton3.backgroundColor || self.selBoton1.backgroundColor == self.selBoton4.backgroundColor || self.selBoton2.backgroundColor == self.selBoton3.backgroundColor || self.selBoton2.backgroundColor == self.selBoton4.backgroundColor || self.selBoton3.backgroundColor == self.selBoton4.backgroundColor) {
        
        NSString *mensaje = [[NSString alloc] initWithFormat: @"No puedes tener colores repetidos"];
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Error"
                                                         message:mensaje
                                                        delegate:self
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles: nil];
        [alerta show];
    }
    else {
        // comparacion de colores
        [self verificaColores:self.color1 color2:self.color2 color3:self.color3 color4:self.color4 conBoton:self.selBoton1];
        [self verificaColores:self.color1 color2:self.color2 color3:self.color3 color4:self.color4 conBoton:self.selBoton2];
        [self verificaColores:self.color1 color2:self.color2 color3:self.color3 color4:self.color4 conBoton:self.selBoton3];
        [self verificaColores:self.color1 color2:self.color2 color3:self.color3 color4:self.color4 conBoton:self.selBoton4];
    }
}

- (void)coloresRandom {
    int r = arc4random_uniform(6);
    int r2, r3, r4;
    do {
        r2 = arc4random_uniform(6);
    } while (r == r2);
    do {
        r3 = arc4random_uniform(6);
    } while (r3 == r2 || r3 == r);
    do {
        r4 = arc4random_uniform(6);
    } while (r4 == r3 || r4 == r2 || r4 == r);
    
    // NSLog(@"%i, %i, %i, %i", r, r2, r3, r4);
    
    //Manda llamar funcion para
    [self colorProbar:self.color1 numero:r];
    [self colorProbar:self.color2 numero:r2];
    [self colorProbar:self.color3 numero:r3];
    [self colorProbar:self.color4 numero:r4];
}

- (void)colorProbar:(UIView *)vista numero:(int)random {
    switch (random) {
        case 0:
            vista.backgroundColor = UIColor.blackColor;
            break;
        case 1:
            vista.backgroundColor = UIColor.blueColor;
            break;
        case 2:
            vista.backgroundColor = UIColor.yellowColor;
            break;
        case 3:
            vista.backgroundColor = UIColor.greenColor;
            break;
        case 4:
            vista.backgroundColor = UIColor.grayColor;
            break;
        case 5:
            vista.backgroundColor = UIColor.redColor;
        default:
            break;
    }
}

- (void)verificaColores:(UIView *)solucion color2:(UIView *)solucion2 color3:(UIView *)solucion3 color4:(UIView *)solucion4 conBoton:(UIButton *)boton {
    // Posicion y color correcto - Rojo
    if (solucion.backgroundColor == boton.backgroundColor || solucion2.backgroundColor == boton.backgroundColor || solucion3.backgroundColor == boton.backgroundColor || solucion4.backgroundColor == boton.backgroundColor) {
//        self.cuentaVistas++;
//        switch (self.cuentaVistas) {
//            case 1:
//                self.correcto1.backgroundColor = UIColor.redColor;
//                self.correcto1.hidden = NO;
//                break;
//            case 2:
//                self.correcto2.backgroundColor = UIColor.redColor;
//                self.correcto2.hidden = NO;
//                break;
//            case 3:
//                self.correcto3.backgroundColor = UIColor.redColor;
//                self.correcto3.hidden = NO;
//                break;
//            case 4:
//                self.correcto4.backgroundColor = UIColor.redColor;
//                self.correcto4.hidden = NO;
//                break;
//                
//            default:
//                break;
//        }
//        if (self.cuentaVistas > 4) {
//            self.cuentaVistas = 0;
//        }
    }
    /*
    if ((solucion.backgroundColor == boton.backgroundColor && solucion2.backgroundColor == boton.backgroundColor) || (solucion.backgroundColor == boton.backgroundColor && solucion3.backgroundColor == boton.backgroundColor) || (solucion.backgroundColor == boton.backgroundColor && solucion4.backgroundColor == boton.backgroundColor) || (solucion2.backgroundColor == boton.backgroundColor && solucion3.backgroundColor == boton.backgroundColor) || (solucion2.backgroundColor == boton.backgroundColor && solucion4.backgroundColor == boton.backgroundColor) || (solucion3.backgroundColor == boton.backgroundColor && solucion4.backgroundColor == boton.backgroundColor)) {
        self.correcto1.backgroundColor = UIColor.redColor;
        self.correcto2.backgroundColor = UIColor.redColor;
    }
    if ((solucion.backgroundColor == boton.backgroundColor && solucion2.backgroundColor == boton.backgroundColor)) {
        <#statements#>
    }
     */
    
    // Posición equivocada y color correcto - Blanco
}

@end
