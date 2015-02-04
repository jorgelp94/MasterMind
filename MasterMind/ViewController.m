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

int cuentaAlertas = 0;

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
    
    self.contadorIntentos = 0;
    
    self.contadorPosicionCorrecta = 0;
    self.contadorColorCorrecto = 0;
    
    self.viewProbar.hidden = YES; //Oculta segundo View
    
    self.correcto1.hidden = YES;
    self.correcto2.hidden = YES;
    self.correcto3.hidden = YES;
    self.correcto4.hidden = YES;
    
    [self coloresRandom];
    
    self.controlSegmento.selectedSegmentIndex = 0;
    
    if (cuentaAlertas <= 1) {
        NSString *mensaje = [[NSString alloc] initWithFormat: @"Por alguna razón no funciona correctamente al inciar el juego si no hasta que oprimes el boton probar después de seleccionar un patrón, luego reinicias el juego, pruebas, vuelves a reiniciar y ahora si funciona. En algunos casos funciona con que pruebes y reinicies una vez."];
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Saludos"
                                                         message:mensaje
                                                        delegate:self
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles: nil];
        [alerta show];
        cuentaAlertas++;
    }

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
        self.contadorIntentos += 1;
        
        //Reinicia views indicadores de respuesta
        self.correcto1.hidden = YES;
        self.correcto2.hidden = YES;
        self.correcto3.hidden = YES;
        self.correcto4.hidden = YES;
        
        [self verificaColores:self.color1 color2:self.color2 color3:self.color3 color4:self.color4 conBoton:self.selBoton1 segundoBoton:self.selBoton2 tercerBoton:self.selBoton3 cuartoBoton:self.selBoton4];
        
        // Reinicia contadores
        self.contadorColorCorrecto = 0;
        self.contadorPosicionCorrecta = 0;
        
        
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

- (void)verificaColores:(UIView *)solucion color2:(UIView *)solucion2 color3:(UIView *)solucion3 color4:(UIView *)solucion4 conBoton:(UIButton *)boton segundoBoton:(UIButton *)boton2 tercerBoton:(UIButton *)boton3 cuartoBoton:(UIButton *)boton4 {
    
    // Compara primer botón
    if (solucion.backgroundColor == boton.backgroundColor) {
        // View 1 cambia a rojo
        // Posicion y color correcto - Rojo
        self.contadorPosicionCorrecta += 1;
        switch (self.contadorPosicionCorrecta) {
            case 1:
                self.correcto1.backgroundColor = UIColor.redColor;
                self.correcto1.hidden = NO;
                break;
            
            case 2:
                self.correcto2.backgroundColor = UIColor.redColor;
                self.correcto2.hidden = NO;
                break;
            
            case 3:
                self.correcto3.backgroundColor = UIColor.redColor;
                self.correcto3.hidden = NO;
                break;
                
            case 4:
                self.correcto4.backgroundColor = UIColor.redColor;
                self.correcto4.hidden = NO;
                break;
                
            default:
                break;
        }
        
    } else if(solucion2.backgroundColor == boton.backgroundColor || solucion3.backgroundColor == boton.backgroundColor || solucion4.backgroundColor == boton.backgroundColor) {
        // View 4 cambia a blanco
        // Posición equivocada y color correcto - Blanco
        self.contadorColorCorrecto += 1;
        switch (self.contadorColorCorrecto) {
            case 1:
                self.correcto4.backgroundColor = UIColor.whiteColor;
                self.correcto4.hidden = NO;
                break;
                
            case 2:
                self.correcto3.backgroundColor = UIColor.whiteColor;
                self.correcto3.hidden = NO;
                break;
                
            case 3:
                self.correcto2.backgroundColor = UIColor.whiteColor;
                self.correcto2.hidden = NO;
                break;
                
            case 4:
                self.correcto1.backgroundColor = UIColor.whiteColor;
                self.correcto1.hidden = NO;
                break;
                
            default:
                break;
        }
    }
    
    // Compara segundo boton
    if (solucion2.backgroundColor == boton2.backgroundColor) {
        // View 1 cambia a rojo
        // Posicion y color correcto - Rojo
        self.contadorPosicionCorrecta += 1;
        switch (self.contadorPosicionCorrecta) {
            case 1:
                self.correcto1.backgroundColor = UIColor.redColor;
                self.correcto1.hidden = NO;
                break;
                
            case 2:
                self.correcto2.backgroundColor = UIColor.redColor;
                self.correcto2.hidden = NO;
                break;
                
            case 3:
                self.correcto3.backgroundColor = UIColor.redColor;
                self.correcto3.hidden = NO;
                break;
                
            case 4:
                self.correcto4.backgroundColor = UIColor.redColor;
                self.correcto4.hidden = NO;
                break;
                
            default:
                break;
        }
        
    } else if(solucion.backgroundColor == boton2.backgroundColor || solucion3.backgroundColor == boton2.backgroundColor || solucion4.backgroundColor == boton2.backgroundColor) {
        // View 4 cambia a blanco
        // Posición equivocada y color correcto - Blanco
        self.contadorColorCorrecto += 1;
        switch (self.contadorColorCorrecto) {
            case 1:
                self.correcto4.backgroundColor = UIColor.whiteColor;
                self.correcto4.hidden = NO;
                break;
                
            case 2:
                self.correcto3.backgroundColor = UIColor.whiteColor;
                self.correcto3.hidden = NO;
                break;
                
            case 3:
                self.correcto2.backgroundColor = UIColor.whiteColor;
                self.correcto2.hidden = NO;
                break;
                
            case 4:
                self.correcto1.backgroundColor = UIColor.whiteColor;
                self.correcto1.hidden = NO;
                break;
                
            default:
                break;
        }
    }
    
    // Compara tercer boton
    if (solucion3.backgroundColor == boton3.backgroundColor) {
        // View 1 cambia a rojo
        // Posicion y color correcto - Rojo
        self.contadorPosicionCorrecta += 1;
        switch (self.contadorPosicionCorrecta) {
            case 1:
                self.correcto1.backgroundColor = UIColor.redColor;
                self.correcto1.hidden = NO;
                break;
                
            case 2:
                self.correcto2.backgroundColor = UIColor.redColor;
                self.correcto2.hidden = NO;
                break;
                
            case 3:
                self.correcto3.backgroundColor = UIColor.redColor;
                self.correcto3.hidden = NO;
                break;
                
            case 4:
                self.correcto4.backgroundColor = UIColor.redColor;
                self.correcto4.hidden = NO;
                break;
                
            default:
                break;
        }
        
    } else if(solucion.backgroundColor == boton3.backgroundColor || solucion2.backgroundColor == boton3.backgroundColor || solucion4.backgroundColor == boton3.backgroundColor) {
        // View 4 cambia a blanco
        // Posición equivocada y color correcto - Blanco
        self.contadorColorCorrecto += 1;
        switch (self.contadorColorCorrecto) {
            case 1:
                self.correcto4.backgroundColor = UIColor.whiteColor;
                self.correcto4.hidden = NO;
                break;
                
            case 2:
                self.correcto3.backgroundColor = UIColor.whiteColor;
                self.correcto3.hidden = NO;
                break;
                
            case 3:
                self.correcto2.backgroundColor = UIColor.whiteColor;
                self.correcto2.hidden = NO;
                break;
                
            case 4:
                self.correcto1.backgroundColor = UIColor.whiteColor;
                self.correcto1.hidden = NO;
                break;
                
            default:
                break;
        }
    }

    // Compara cuarto boton
    if (solucion4.backgroundColor == boton4.backgroundColor) {
        // View 1 cambia a rojo
        // Posicion y color correcto - Rojo
        self.contadorPosicionCorrecta += 1;
        switch (self.contadorPosicionCorrecta) {
            case 1:
                self.correcto1.backgroundColor = UIColor.redColor;
                self.correcto1.hidden = NO;
                break;
                
            case 2:
                self.correcto2.backgroundColor = UIColor.redColor;
                self.correcto2.hidden = NO;
                break;
                
            case 3:
                self.correcto3.backgroundColor = UIColor.redColor;
                self.correcto3.hidden = NO;
                break;
                
            case 4:
                self.correcto4.backgroundColor = UIColor.redColor;
                self.correcto4.hidden = NO;
                break;
                
            default:
                break;
        }
        
    } else if(solucion.backgroundColor == boton4.backgroundColor || solucion2.backgroundColor == boton4.backgroundColor || solucion3.backgroundColor == boton4.backgroundColor) {
        // View 4 cambia a blanco
        // Posición equivocada y color correcto - Blanco
        self.contadorColorCorrecto += 1;
        switch (self.contadorColorCorrecto) {
            case 1:
                self.correcto4.backgroundColor = UIColor.whiteColor;
                self.correcto4.hidden = NO;
                break;
                
            case 2:
                self.correcto3.backgroundColor = UIColor.whiteColor;
                self.correcto3.hidden = NO;
                break;
                
            case 3:
                self.correcto2.backgroundColor = UIColor.whiteColor;
                self.correcto2.hidden = NO;
                break;
                
            case 4:
                self.correcto1.backgroundColor = UIColor.whiteColor;
                self.correcto1.hidden = NO;
                break;
                
            default:
                break;
        }
    }
    
    if (self.correcto1.backgroundColor == UIColor.redColor && self.correcto2.backgroundColor == UIColor.redColor && self.correcto3.backgroundColor == UIColor.redColor && self.correcto4.backgroundColor == UIColor.redColor) {
        NSString *mensaje = [[NSString alloc] initWithFormat: @"Ganaste en %i intentos", self.contadorIntentos];
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Felicidades"
                                                         message:mensaje
                                                        delegate:self
                                               cancelButtonTitle:@"Volver a jugar"
                                               otherButtonTitles: nil];
        [alerta show];
        [self viewDidLoad];
    }
    
}


@end
