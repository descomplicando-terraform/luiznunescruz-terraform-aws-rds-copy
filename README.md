# luiznunescruz-terraform-aws-rds-copy
Módulo Terraform para realizar a cópia de bancos de dados RDS.

TODO:
    - Implementar Cross-accounting:
        - Estudar melhor as limitações;
            - Criar KMS compartilhada;
            - ou Usar S3 para evitar erros de chaves;
    - Verificar melhor forma de lhe dar com password do RDS:
        - Usar o Secret Manager;

<!--- BEGIN_TF_DOCS ---> 
<!--- END_TF_DOCS --->