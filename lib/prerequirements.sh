PREREQUIREMENTS=(
  curl
  git
)
missing=false

for r in "${PREREQUIREMENTS[@]}"
do
  if !(type ${r})&>/dev/null; then
    echo "${r} is not installed"
    missing=true
  fi
done

if $missing; then
  exit 0
fi
