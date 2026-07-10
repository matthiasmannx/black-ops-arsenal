# Shared builds — Supabase setup (free, ~3 min)

To let your friends see each other's builds, the site needs one small free online
database. We use **Supabase** (free tier, no credit card). Do this once:

## 1. Create a project
1. Go to https://supabase.com → **Start your project** → sign in (GitHub login is fine).
2. **New project**. Give it a name (e.g. `black-ops-arsenal`), set a database password
   (any — you won't need it), pick the closest region, click **Create new project**.
3. Wait ~1 minute until it's ready.

## 2. Create the table (copy-paste SQL)
1. In the left menu open **SQL Editor** → **New query**.
2. Paste the SQL from the file `supabase-schema.sql` (in this project folder) and
   click **Run**. IMPORTANT: paste only the SQL — do NOT include any ``` backticks.
   You should see "Success. No rows returned".

This lets anyone **read** all builds and **add** a build (with basic length checks),
but nobody can edit or delete others' builds.

## 3. Grab the two values I need
1. Left menu → **Project Settings** (gear) → **API**.
2. Copy:
   - **Project URL** (looks like `https://xxxxxxxx.supabase.co`)
   - **anon public** key (the long `eyJ...` string under "Project API keys")

Paste both to me. (The anon key is safe to put in the public site — that's what it's
designed for; security comes from the rules above.)

## What happens next
I plug those two values into the site. From then on:
- Saving a build (name + title) posts it to the shared list.
- Every weapon shows all community builds with **who made it** and **what's in it**.
- Works for all your friends, on any device, no login needed for them.
