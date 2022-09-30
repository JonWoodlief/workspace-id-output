# Create an arbitrary local resource
data "template_file" "test" {
  template = "Hello ${var.name} from ${terraform.workspace}"
}

data "external" "workspace_id" {
  program = ["jq", "-n", "{id: env | .TF_VAR_IC_SCHEMATICS_WORKSPACE_ID}"]
}

output "workspace_id" {
  value = data.external.workspace_id.result.id
}

variable "IC_SCHEMATICS_WORKSPACE_ID" {
  default = ""
  description = "leave blank if running locally. This variable will be automatically populated if running from an IBM Cloud Schematics workspace"
}

output "workspace_id2" {
  value = var.IC_SCHEMATICS_WORKSPACE_ID
}
