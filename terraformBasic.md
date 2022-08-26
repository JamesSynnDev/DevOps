
# Getting Start

terraform

export AWS_ACCESS_KEY_ID=(access id) 
export AWS_SECRET_ACCESS_KEY=(secret key)
저장

nano main.tf
> 

terraform init # 

terraform plan

terraform apply # 인스턴스 생성

-> apply 하기 전에 종속성 확인
terraform graph # 종속성 그래프 표시
그래프비즈( Graphviz )
그래프비즈온라인( GraphvizOnline, )


terraform destroy

작업이 끝나면 모든 리소스를 제거하는 것이 좋다 비용 청구됨