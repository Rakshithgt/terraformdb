data "aws_secretsmanager_secret" "db_secret" {
    name = "test-db-password"
}

data "aws_secretsmanager_secret_version" "password" {
  secret_id = aws_secretsmanager_secret.password.id
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [
    aws_subnet.subnet1-public.id,
    aws_subnet.subnet2-public.id,
  ]
  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "test_db_instance" {
  identifier           = "testdb"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0.39"
  instance_class       = "db.t3.medium"
  username             = "dbadmin"
  password             = data.aws_secretsmanager_secret_version.password.secret_string
  publicly_accessible  = true
  db_subnet_group_name = aws_db_subnet_group.default.id

   skip_final_snapshot     = false
final_snapshot_identifier = "testdb-final-snapshot-20241222"

}


