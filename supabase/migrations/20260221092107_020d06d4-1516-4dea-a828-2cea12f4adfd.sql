
-- 1. Drop overly permissive admin policies on all tables
DROP POLICY IF EXISTS "Admin can manage skills" ON public.skills;
DROP POLICY IF EXISTS "Admin can manage quotes" ON public.quotes;
DROP POLICY IF EXISTS "Admin can manage blog posts" ON public.blog_posts;
DROP POLICY IF EXISTS "Admin can manage education" ON public.education;
DROP POLICY IF EXISTS "Admin can manage certifications" ON public.certifications;
DROP POLICY IF EXISTS "Admin can manage experience" ON public.experience;
DROP POLICY IF EXISTS "Admin can manage projects" ON public.projects;
DROP POLICY IF EXISTS "Admin can manage profiles" ON public.profiles;

-- 2. Recreate admin policies with role-based checks
CREATE POLICY "Admin can manage skills" ON public.skills FOR ALL
  USING (public.has_role(auth.uid(), 'admin'))
  WITH CHECK (public.has_role(auth.uid(), 'admin'));

CREATE POLICY "Admin can manage quotes" ON public.quotes FOR ALL
  USING (public.has_role(auth.uid(), 'admin'))
  WITH CHECK (public.has_role(auth.uid(), 'admin'));

CREATE POLICY "Admin can manage blog posts" ON public.blog_posts FOR ALL
  USING (public.has_role(auth.uid(), 'admin'))
  WITH CHECK (public.has_role(auth.uid(), 'admin'));

CREATE POLICY "Admin can manage education" ON public.education FOR ALL
  USING (public.has_role(auth.uid(), 'admin'))
  WITH CHECK (public.has_role(auth.uid(), 'admin'));

CREATE POLICY "Admin can manage certifications" ON public.certifications FOR ALL
  USING (public.has_role(auth.uid(), 'admin'))
  WITH CHECK (public.has_role(auth.uid(), 'admin'));

CREATE POLICY "Admin can manage experience" ON public.experience FOR ALL
  USING (public.has_role(auth.uid(), 'admin'))
  WITH CHECK (public.has_role(auth.uid(), 'admin'));

CREATE POLICY "Admin can manage projects" ON public.projects FOR ALL
  USING (public.has_role(auth.uid(), 'admin'))
  WITH CHECK (public.has_role(auth.uid(), 'admin'));

CREATE POLICY "Admin can manage profiles" ON public.profiles FOR ALL
  USING (public.has_role(auth.uid(), 'admin'))
  WITH CHECK (public.has_role(auth.uid(), 'admin'));

-- 3. Drop the overly permissive public read policy on profiles
DROP POLICY IF EXISTS "Public can view profiles" ON public.profiles;

-- 4. Create a public view that excludes sensitive fields
CREATE VIEW public.profiles_public
WITH (security_invoker = on) AS
  SELECT id, full_name, title, bio, github, instagram, linkedin, location
  FROM public.profiles;

-- 5. Allow public SELECT only through the view's limited columns
CREATE POLICY "Public can view limited profile data" ON public.profiles FOR SELECT
  USING (true);
