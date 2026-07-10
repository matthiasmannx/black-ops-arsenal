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
2. Paste this and click **Run**:

```sql
create table if not exists public.loadouts (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz default now(),
  game text not null,
  weapon text not null,
  author text not null,
  title text not null,
  attachments jsonb not null default '[]',
  perks jsonb not null default '[]'
);

alter table public.loadouts enable row level security;

create policy "public read"   on public.loadouts
  for select to anon using (true);

create policy "public insert" on public.loadouts
  for insert to anon with check (
    char_length(author) between 1 and 24 and
    char_length(title)  between 1 and 40
  );
```

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
