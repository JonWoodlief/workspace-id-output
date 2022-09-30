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
