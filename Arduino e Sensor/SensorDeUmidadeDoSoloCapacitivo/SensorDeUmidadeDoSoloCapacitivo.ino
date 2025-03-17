// Sensor de Umidade do Solo Capacitivo

const int PINO_SENSOR_UMIDADE_SOLO = A0; // Variável que aloca o valor recebido do Analógico

void setup() { // Determina a iniciação do programa de a configuração dos pinos do Arduino
  Serial.begin(9600); // Configura a taxa de cominicação de bits por segundo
  pinMode(PINO_SENSOR_UMIDADE_SOLO, INPUT); // Recebe o sensor que está ligado ao arduino 
}

void loop() { // Repetição do código
  int leituraSensor = analogRead(PINO_SENSOR_UMIDADE_SOLO); // Atribuição da variável leituraSensor com o valor recebido do analógico
 // Invertendo as métricas do sensor para captar a porcentagem de Umidade
  float umidade = map(leituraSensor, 0, 1023, 100, 0);
  // Exibição de mensagem "Umidade do Solo:"
  
  // Umidade Máxima
  Serial.print("UmidadeMáxima:"); // Label de Secura Máxima
  Serial.print(40); // Valor da Secura Máxima
  Serial.print(" "); // Intervalo para inserção de outro valor
  
  // Umidade
  Serial.print("Umidade:"); // Label de valor da Secura
  Serial.print(umidade - 20); // Valor medido pelo sensor - 20 para se adequar as condições do projeto
  Serial.print(" "); // Intervalo para inserção de outro valor

  // Umidade Mínima
  Serial.print("UmidadeMínima:"); // Label para Secura Mínima
  Serial.println(20); // Valor da Secura Mínima
  
  

  delay(50); // Tempo para executar o código novamente
}