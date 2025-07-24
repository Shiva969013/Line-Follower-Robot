// Line Follower Robot - Arduino Code

// Motor pins
const int ENA = 5; // Left motor speed
const int IN1 = 2;
const int IN2 = 3;

const int ENB = 6; // Right motor speed
const int IN3 = 4;
const int IN4 = 7;

// IR Sensor pins (Left, Center, Right)
const int leftSensor = 8;
const int centerSensor = 9;
const int rightSensor = 10;

void setup() {
  // Set motor pins as output
  pinMode(ENA, OUTPUT);
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);

  pinMode(ENB, OUTPUT);
  pinMode(IN3, OUTPUT);
  pinMode(IN4, OUTPUT);

  // Set sensor pins as input
  pinMode(leftSensor, INPUT);
  pinMode(centerSensor, INPUT);
  pinMode(rightSensor, INPUT);
}

void loop() {
  // Read sensor values (LOW = black, HIGH = white)
  int left = digitalRead(leftSensor);
  int center = digitalRead(centerSensor);
  int right = digitalRead(rightSensor);

  // Condition: Move Forward
  if (center == LOW && left == HIGH && right == HIGH) {
    moveForward();
  }
  // Condition: Turn Left
  else if (left == LOW) {
    turnLeft();
  }
  // Condition: Turn Right
  else if (right == LOW) {
    turnRight();
  }
  // All sensors on white (stop or lost)
  else {
    stopMotors();
  }
}

void moveForward() {
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  analogWrite(ENA, 150);

  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
  analogWrite(ENB, 150);
}

void turnLeft() {
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);
  analogWrite(ENA, 150);

  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
  analogWrite(ENB, 150);
}

void turnRight() {
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  analogWrite(ENA, 150);

  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);
  analogWrite(ENB, 150);
}

void stopMotors() {
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, LOW);
}
