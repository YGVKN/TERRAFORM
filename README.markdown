# TerraForm certs validate
## AWS ACM Validation & Alarm

[![TerraForm | AWS ACM](https://d2908q01vomqb2.cloudfront.net/22d200f8670dbdb3e253a90eee5098477c95c23d/2016/10/11/image1_numbereddiagram_b.png)](https://aws.amazon.com/ru/certificate-manager/)


- shell run >
- alias terra="terraform"
- export TF_LOG_DEBUG=1
- terra init
- terra fmt && terra validate
- terra plan    -refresh
- terra apply   -refresh -auto-approve
- terra show && terra state list
- terra destroy -auto-approve
[YGVKN](sensoriumxr.com)
- ✨Magic ✨
