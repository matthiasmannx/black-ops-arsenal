-- Run this in Supabase → SQL Editor (paste WITHOUT any ``` backticks) → Run.
-- Adds upvoting to builds.

alter table public.loadouts
  add column if not exists votes int not null default 0;

create or replace function public.upvote(build_id uuid)
returns integer
language sql
security definer
as $$
  update public.loadouts set votes = votes + 1 where id = build_id
  returning votes;
$$;

grant execute on function public.upvote(uuid) to anon;
