//
//  ViewController.h
//  MasterMind
//
//  Created by Jorge Luis Perales on 29/01/15.
//  Copyright (c) 2015 Jorge Luis Perales. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//Outlets
@property (strong, nonatomic) IBOutlet UIView *viewProbar;
@property (strong, nonatomic) IBOutlet UIView *color1;
@property (strong, nonatomic) IBOutlet UIView *color2;
@property (strong, nonatomic) IBOutlet UIView *color3;
@property (strong, nonatomic) IBOutlet UIView *color4;


@property (strong, nonatomic) IBOutlet UIView *correcto1;
@property (strong, nonatomic) IBOutlet UIView *correcto2;
@property (strong, nonatomic) IBOutlet UIView *correcto3;
@property (strong, nonatomic) IBOutlet UIView *correcto4;

@property (strong, nonatomic) IBOutlet UIButton *selBoton1;
@property (strong, nonatomic) IBOutlet UIButton *selBoton2;
@property (strong, nonatomic) IBOutlet UIButton *selBoton3;
@property (strong, nonatomic) IBOutlet UIButton *selBoton4;

@property (strong, nonatomic) IBOutlet UISegmentedControl *controlSegmento;

//Actions

- (IBAction)control:(UISegmentedControl *)sender;
- (IBAction)boton1:(UIButton *)sender;
- (IBAction)boton2:(UIButton *)sender;
- (IBAction)boton3:(UIButton *)sender;
- (IBAction)boton4:(UIButton *)sender;

- (IBAction)botonIniciar:(UIButton *)sender;
- (IBAction)botonProbar:(UIButton *)sender;

@property int colorCount;
@property int colorCount2;
@property int colorCount3;
@property int colorCount4;

@property int contadorIntentos;

@property int contadorPosicionCorrecta;
@property int contadorColorCorrecto;

@property BOOL agregarojo1;
@property BOOL agregarojo2;
@property BOOL agregarojo3;
@property BOOL agregarojo4;

@property BOOL agregaBlanco1;
@property BOOL agregaBlanco2;
@property BOOL agregaBlanco3;
@property BOOL agregaBlanco4;

@end

