//
//  ViewController.m
//  Ejercicio3
//
//  Created by Jonathan Pacheco on 12/21/14.
//  Copyright (c) 2014 Jonathan Pacheco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *valueLabel;
@property (strong, nonatomic) IBOutlet UIButton *selectdButton;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIProgressView *progresView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Textfield delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.tag == 1) {
//        viewWithtag es para obtener el control con el tag especificado
        UITextField *becomeTextField = (UITextField *)[self.view viewWithTag:2];
//      become first responder es para dar el enfoque a un control
        [becomeTextField becomeFirstResponder];
    } else {
//        resing firts responder es para quitar el enfoque de un control
        [textField resignFirstResponder];
    }
    return YES;
}

- (IBAction)buttonAction:(id)sender {
//    isKindOfClass sirve para verificar que tipo de dato es el objecto que hace referencia
    if ([sender isKindOfClass:UIButton.class]) {
        UIButton *button = (UIButton *)sender;
//      Cambiamos el estado a seleccionado si está en el estado por defecto
//        Si está en el estado selecionado lo cambiamos a por defecto
        button.selected = !button.selected;
    }
}

- (IBAction)sliderAction:(UISlider *)sender {
    // Asignamos el valor seleccionado en el slider convertido a porcentaje
    // %.(numero de caracteres decimales que queremos mostrar)f
    self.valueLabel.text = [NSString stringWithFormat:@"El valor es: %.0f%%", (sender.value * 100)];
    // Asignamos el valor del slider al progreso del profressView
    self.progresView.progress = sender.value;
}

- (IBAction)switchAction:(UISwitch *)sender {
    self.selectdButton.selected = sender.on;
    // ActivityIndicator muestra la animación si el switch está en el estado ON
    if (sender.on) {
        [self.activityIndicator startAnimating];
    } else {
        [self.activityIndicator stopAnimating];
    }
}

@end
