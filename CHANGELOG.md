## Unreleased
* Add support for authorizers
* Add more extensive testing for non-proxy use cases

## 0.1.4 (June 23, 2017)
* Include addtional conditions for method resources.

## 0.1.3 (June 22, 2017)
* Added response_models and response_parameters to aws_api_gateway_method_response resource

## 0.1.2 (June 8, 2017)

#### BACKWARDS INCOMPATIBILITIES / NOTES
* `api_label` has been replaced with `api_name` in the api module.
* `stack_item_fullname` has been replaced with `api_description` in the api module.
* `stack_item_lable` has been removed from the api module.

#### IMPROVEMENTS / NEW FEATURES
* Added support for use of IAM roles with the nested AWS provider used for certificate lookup from us-east-1.
* Updated API naming variables to allow for more descriptive names and descriptions.

## 0.1.1 (April 19, 2017)

#### BUG FIXES
* Fixed issue with TLS certificate discovery when provisioning a custom domain.

## 0.1.0 (April 18, 2017)
* Initial release
