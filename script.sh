start="2026-02-01"
end="2026-04-30"

i=1
current="$start"

while [ "$(date -d "$current" +%Y%m%d)" -le "$(date -d "$end" +%Y%m%d)" ]
do
  # create file for each day
  echo "Day $i commit" > "Day$i.txt"

  # stage file
  git add .

  # commit with custom date
  GIT_AUTHOR_DATE="$current 12:00:00" GIT_COMMITTER_DATE="$current 12:00:00" \
  git commit -m "Day $i"

  # next day
  current=$(date -d "$current + 1 day" +"%Y-%m-%d")
  i=$((i+1))
done
