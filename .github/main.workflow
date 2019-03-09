workflow "deploy" {
  on = "push"
  resolves = ["deploy firebase"]
}

action "elm build" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "run build --prefix my-app"
}

action "deploy firebase" {
  uses = "w9jds/firebase-action@7d6b2b058813e1224cdd4db255b2f163ae4084d3"
  needs = ["elm build"]
  args = "deploy"
  secrets = ["FIREBASE_TOKEN"]
}
