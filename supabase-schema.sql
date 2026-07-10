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

create policy "public read" on public.loadouts
  for select to anon using (true);

create policy "public insert" on public.loadouts
  for insert to anon with check (
    char_length(author) between 1 and 24 and
    char_length(title) between 1 and 40
  );
