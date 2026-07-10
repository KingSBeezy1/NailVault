create extension if not exists "uuid-ossp";

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text,
  business_name text,
  email text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.clients (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references auth.users(id) on delete cascade,
  first_name text not null,
  last_name text not null,
  phone_number text,
  email text,
  instagram_username text,
  birthday date,
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.appointments (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references auth.users(id) on delete cascade,
  client_id uuid not null references public.clients(id) on delete cascade,
  appointment_date timestamptz not null,
  duration_minutes int not null default 60,
  price numeric(10,2) not null default 0,
  status text not null default 'scheduled',
  completed boolean not null default false,
  cancelled boolean not null default false,
  no_show boolean not null default false,
  notes text,
  nail_shape text,
  length text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.appointment_photos (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references auth.users(id) on delete cascade,
  appointment_id uuid not null references public.appointments(id) on delete cascade,
  storage_url text not null,
  thumbnail_url text,
  upload_status text not null default 'queued',
  taken_at timestamptz not null default now(),
  notes text,
  favorite boolean not null default false,
  instagram_posted boolean not null default false,
  facebook_posted boolean not null default false,
  tiktok_posted boolean not null default false,
  created_at timestamptz not null default now()
);

create table if not exists public.products (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  brand text,
  category text,
  created_at timestamptz not null default now()
);

create table if not exists public.appointment_products (
  appointment_id uuid not null references public.appointments(id) on delete cascade,
  product_id uuid not null references public.products(id) on delete cascade,
  primary key (appointment_id, product_id)
);

create table if not exists public.tags (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  category text,
  created_at timestamptz not null default now(),
  unique (user_id, name)
);

create table if not exists public.photo_tags (
  photo_id uuid not null references public.appointment_photos(id) on delete cascade,
  tag_id uuid not null references public.tags(id) on delete cascade,
  primary key (photo_id, tag_id)
);

create index if not exists idx_clients_user_id on public.clients (user_id);
create index if not exists idx_appointments_user_id on public.appointments (user_id);
create index if not exists idx_appointments_client_id on public.appointments (client_id);
create index if not exists idx_photos_appointment_id on public.appointment_photos (appointment_id);
create index if not exists idx_photos_user_id on public.appointment_photos (user_id);
create index if not exists idx_products_user_id on public.products (user_id);
create index if not exists idx_tags_user_id on public.tags (user_id);

alter table public.profiles enable row level security;
alter table public.clients enable row level security;
alter table public.appointments enable row level security;
alter table public.appointment_photos enable row level security;
alter table public.products enable row level security;
alter table public.appointment_products enable row level security;
alter table public.tags enable row level security;
alter table public.photo_tags enable row level security;

create policy if not exists profiles_isolated on public.profiles
  for all using (auth.uid() = id) with check (auth.uid() = id);

create policy if not exists clients_isolated on public.clients
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy if not exists appointments_isolated on public.appointments
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy if not exists photos_isolated on public.appointment_photos
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy if not exists products_isolated on public.products
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy if not exists appointment_products_isolated on public.appointment_products
  for all using (
    exists (
      select 1 from public.appointments a
      where a.id = appointment_products.appointment_id and a.user_id = auth.uid()
    )
  ) with check (
    exists (
      select 1 from public.appointments a
      where a.id = appointment_products.appointment_id and a.user_id = auth.uid()
    )
  );

create policy if not exists tags_isolated on public.tags
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy if not exists photo_tags_isolated on public.photo_tags
  for all using (
    exists (
      select 1 from public.appointment_photos p
      where p.id = photo_tags.photo_id and p.user_id = auth.uid()
    )
  ) with check (
    exists (
      select 1 from public.appointment_photos p
      where p.id = photo_tags.photo_id and p.user_id = auth.uid()
    )
  );

insert into storage.buckets (id, name, public)
values ('appointment-images', 'appointment-images', false)
on conflict (id) do nothing;
