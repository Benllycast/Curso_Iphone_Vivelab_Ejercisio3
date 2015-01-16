//
//  ViewController2.m
//  Ejercicio3
//
//  Created by Jonathan Pacheco on 12/21/14.
//  Copyright (c) 2014 Jonathan Pacheco. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic, assign) NSInteger rowVelocitySelected;
@property (nonatomic, assign) NSInteger rowMetricsSelected;
@property (strong, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://google.com.co/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dateSelectedAction:(UIDatePicker *)sender {
    // Sender es el datepicker, y se ejecuta este método cada vez que se selecciona una fecha diferente
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    
    formater.dateFormat = @"dd/MM/yyyy HH:mm:ss";
    
    self.dateLabel.text = [formater stringFromDate:sender.date];
}

#pragma mark - Picker view data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return 20;
    } else {
        return 2;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [NSString stringWithFormat:@"%lu", (row + 1) * 10];
    } else {
        return row == 0 ? @"km/h" : @"m/h";
    }
}

#pragma mark - Picker view delegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *velocity;
    // Preguntamos cual componente está seleccionado
    if (component == 0) {
        // num calculamos el numero a partir de la celda seleccionada en el componente cero
        NSInteger num = (row + 1) * 10;
        // Verificamos el valor de la fila selecionada anteriormente en el compomente 1 para validar la metrica a mostrar
        NSString *metrics = self.rowMetricsSelected == 0 ? @"km/h" : @"m/h";
        // Construimos el String a mostrar
        velocity = [NSString stringWithFormat:@"%lu %@", num, metrics];
        // Almacenamos el valor de la fila del componente 0 para usarlo en futuras llamadas del método
        self.rowVelocitySelected = row;
    } else {
        NSInteger num = (self.rowVelocitySelected + 1) * 10;
        NSString *metrics = row == 0 ? @"km/h" : @"m/h";
        velocity = [NSString stringWithFormat:@"%lu %@", num, metrics];
        self.rowMetricsSelected = row;
    }
    self.dateLabel.text = velocity;
}

@end
