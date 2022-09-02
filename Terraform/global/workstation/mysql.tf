# MySQL 공급자 구성
provider "mysql" {
  endpoint = "my-database.example.com:3306"
  username = "app-user"
  password = "app-password"
}

# 데이터베이스 생성
resource "mysql_database" "app" {
  name = "my_awesome_app"
}

# https://github.com/hashicorp/terraform-provider-mysql/blob/stable-website/website/docs/index.html.markdown