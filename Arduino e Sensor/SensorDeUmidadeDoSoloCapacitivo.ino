// Sensor de Umidade do Solo Capacitivo

const int PINO_SENSOR_UMIDADE_SOLO = A0; // Variável que aloca o valor recebido do Analógico

void setup() { // Determina a iniciação do programa de a configuração dos pinos do Arduino
  Serial.begin(9600); // Configura a taxa de cominicação de bits por segundo
  pinMode(PINO_SENSOR_UMIDADE_SOLO, INPUT); // Recebe o sensor que está ligado ao arduino 
}

void loop() { // Repetição do código
  int leituraSensor = analogRead(PINO_SENSOR_UMIDADE_SOLO); // Atribuição da variável leituraSensor com o valor recebido do analógico

  float porcentagemUmidade = (leituraSensor / 1023.0) * 100; // Calculo para conversão da porcentagem

  // Exibição de mensagem "Umidade do Solo:"
  
  
  Serial.print("SecuraMaxima:"); // Label de Secura Máxima
  Serial.print(40); // Valor da Secura Máxima
  Serial.print(" "); // Intervalo para inserção de outro valor
  Serial.print("Secura:"); // Label de valor da Secura
  Serial.print(porcentagemUmidade - 20); // Valor medido pelo sensor - 20 para se adequar as condições do projeto
  Serial.print(" "); // Intervalo para inserção de outro valor
  Serial.print("SecuraMinima:"); // Label para Secura Mínima
  Serial.println(20); // Valor da Secura Mínima
  
  

  delay(1000); // Tempo para executar o código novamente
}

