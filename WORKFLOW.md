# Article Writing Workflow

## 📋 Standard Process for Each Article

### Phase 1: Planning
1. ✅ Define article scope and objectives
2. ✅ Create outline/structure
3. ✅ Identify what infrastructure to create

### Phase 2: Live Testing on Server
1. 📝 Write Terraform code in article folder
2. 🧪 Test on server (`/home/ubuntu/Terraform Series/articles/XX-topic/`)
3. 🐛 Troubleshoot any issues
4. ✅ Verify everything works
5. 📸 Note where screenshots are needed for each command
6. 🗑️ Destroy all created resources (`terraform destroy`)

### Phase 3: Article Writing
1. ✍️ Write article with tested code
2. 📸 Add `[SCREENSHOT: description]` placeholders
3. 💡 Include troubleshooting tips from testing
4. 🔗 Add links and CTAs

### Phase 4: Review & Publish
1. 👀 Manual review and testing
2. 📸 Add actual screenshots
3. ✅ Push to GitHub
4. 📦 Upload to S3 bucket
5. 🚀 Publish to dev.to
6. 🔄 Update ARTICLE_URLS.md with published URL

## 📸 Screenshot Guidelines

### When to Add Screenshots:
- ✅ Every command execution with output
- ✅ AWS Console steps (IAM, S3, EC2, etc.)
- ✅ VS Code/IDE views
- ✅ Error messages and solutions
- ✅ Final results/verification

### Screenshot Placeholder Format:
```markdown
[SCREENSHOT: terraform init output showing provider download]
[SCREENSHOT: AWS Console showing created S3 bucket]
[SCREENSHOT: terraform plan showing 1 resource to add]
```

## 🧪 Testing Checklist

Before writing article, verify:
- [ ] Code runs without errors
- [ ] All commands work as expected
- [ ] Resources are created successfully
- [ ] Resources can be destroyed cleanly
- [ ] No leftover resources or costs
- [ ] Error scenarios tested (if applicable)

## 🗑️ Cleanup After Testing

Always run:
```bash
terraform destroy
rm -rf .terraform .terraform.lock.hcl terraform.tfstate*
```

Verify in AWS Console:
- [ ] No resources left behind
- [ ] No unexpected costs

## 📁 Article Folder Structure

```
articles/XX-topic/
├── article.md              # Main article content
├── APPROACH.md            # Writing approach/outline
├── terraform/             # Terraform code (if applicable)
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── README.md
└── screenshots/           # Screenshot placeholders
    └── .gitkeep
```

## 🔄 Version Control

After each article completion:
```bash
git add articles/XX-topic/
git commit -m "Add Article X: Topic Name"
git push

# Upload to S3
aws s3 sync articles/ s3://terraform-by-sarvar/articles/
```

## 📊 Progress Tracking

Update `ARTICLE_URLS.md` with:
- Status changes (Planning → Testing → Writing → Finalized → Published)
- dev.to URL after publishing
- Published date
- Any notes or issues encountered

---

**This workflow ensures:**
- ✅ All code is tested before publishing
- ✅ Screenshots are planned and documented
- ✅ No surprise errors for readers
- ✅ Clean, working examples
- ✅ No leftover AWS resources/costs
