resource "github_repository" "this" {
  name        = "online-fitness-platform"
  description = "Online Fitness Platform Repository"

  visibility = "public"
  auto_init  = true
}

resource "github_branch" "main" {
  repository = github_repository.this.name
  branch     = "main"
}

resource "github_repository_file" "gitignore" {
  repository          = github_repository.this.name
  branch              = github_branch.main.branch
  file                = ".gitignore"
  content             = <<-EOT
    # Dependencies
    node_modules/
    npm-debug.log*
    yarn-debug.log*
    yarn-error.log*
    
    # Runtime data
    pids
    *.pid
    *.seed
    *.pid.lock
    
    # Coverage directory used by tools like istanbul
    coverage/
    *.lcov
    
    # nyc test coverage
    .nyc_output
    
    # Environment variables
    .env
    .env.local
    .env.development.local
    .env.test.local
    .env.production.local
    
    # Build outputs
    dist/
    build/
    out/
    
    # IDE files
    .vscode/
    .idea/
    *.swp
    *.swo
    *~
    
    # OS generated files
    .DS_Store
    .DS_Store?
    ._*
    .Spotlight-V100
    .Trashes
    ehthumbs.db
    Thumbs.db
    
    # Logs
    logs
    *.log
    
    # Database
    *.sqlite
    *.db
    
    # Temporary files
    tmp/
    temp/
    
    # Docker
    Dockerfile*
    docker-compose*.yml
    .dockerignore
    
    # Terraform
    *.tfstate
    *.tfstate.*
    .terraform/
    .terraform.lock.hcl
    
    # Fitness platform specific
    uploads/
    user-data/
    workout-videos/
    profile-images/
  EOT
  commit_message      = "Add .gitignore file"
  commit_author       = "Terraform"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}
