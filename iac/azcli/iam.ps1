az role definition list --custom-role-only -o tsv

az role definition create --role-definition "./ReaderSupportRole.json"