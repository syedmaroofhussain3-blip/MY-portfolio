
-- Drop all existing restrictive policies and recreate as permissive

-- PROFILES
DROP POLICY IF EXISTS "Public can view limited profile data" ON public.profiles;
DROP POLICY IF EXISTS "Admin can manage profiles" ON public.profiles;
CREATE POLICY "Public can view limited profile data" ON public.profiles FOR SELECT USING (true);
CREATE POLICY "Admin can manage profiles" ON public.profiles FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin')) WITH CHECK (public.has_role(auth.uid(), 'admin'));

-- SKILLS
DROP POLICY IF EXISTS "Public can view skills" ON public.skills;
DROP POLICY IF EXISTS "Admin can manage skills" ON public.skills;
CREATE POLICY "Public can view skills" ON public.skills FOR SELECT USING (true);
CREATE POLICY "Admin can manage skills" ON public.skills FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin')) WITH CHECK (public.has_role(auth.uid(), 'admin'));

-- PROJECTS
DROP POLICY IF EXISTS "Public can view projects" ON public.projects;
DROP POLICY IF EXISTS "Admin can manage projects" ON public.projects;
CREATE POLICY "Public can view projects" ON public.projects FOR SELECT USING (true);
CREATE POLICY "Admin can manage projects" ON public.projects FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin')) WITH CHECK (public.has_role(auth.uid(), 'admin'));

-- EDUCATION
DROP POLICY IF EXISTS "Public can view education" ON public.education;
DROP POLICY IF EXISTS "Admin can manage education" ON public.education;
CREATE POLICY "Public can view education" ON public.education FOR SELECT USING (true);
CREATE POLICY "Admin can manage education" ON public.education FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin')) WITH CHECK (public.has_role(auth.uid(), 'admin'));

-- EXPERIENCE
DROP POLICY IF EXISTS "Public can view experience" ON public.experience;
DROP POLICY IF EXISTS "Admin can manage experience" ON public.experience;
CREATE POLICY "Public can view experience" ON public.experience FOR SELECT USING (true);
CREATE POLICY "Admin can manage experience" ON public.experience FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin')) WITH CHECK (public.has_role(auth.uid(), 'admin'));

-- CERTIFICATIONS
DROP POLICY IF EXISTS "Public can view certifications" ON public.certifications;
DROP POLICY IF EXISTS "Admin can manage certifications" ON public.certifications;
CREATE POLICY "Public can view certifications" ON public.certifications FOR SELECT USING (true);
CREATE POLICY "Admin can manage certifications" ON public.certifications FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin')) WITH CHECK (public.has_role(auth.uid(), 'admin'));

-- BLOG_POSTS
DROP POLICY IF EXISTS "Public can view published blog posts" ON public.blog_posts;
DROP POLICY IF EXISTS "Admin can manage blog posts" ON public.blog_posts;
CREATE POLICY "Public can view published blog posts" ON public.blog_posts FOR SELECT USING (is_published = true);
CREATE POLICY "Admin can manage blog posts" ON public.blog_posts FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin')) WITH CHECK (public.has_role(auth.uid(), 'admin'));

-- QUOTES
DROP POLICY IF EXISTS "Public can view quotes" ON public.quotes;
DROP POLICY IF EXISTS "Admin can manage quotes" ON public.quotes;
CREATE POLICY "Public can view quotes" ON public.quotes FOR SELECT USING (true);
CREATE POLICY "Admin can manage quotes" ON public.quotes FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin')) WITH CHECK (public.has_role(auth.uid(), 'admin'));

-- USER_ROLES
DROP POLICY IF EXISTS "Users can view their own roles" ON public.user_roles;
DROP POLICY IF EXISTS "Admins can manage all roles" ON public.user_roles;
CREATE POLICY "Users can view their own roles" ON public.user_roles FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "Admins can manage all roles" ON public.user_roles FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin')) WITH CHECK (public.has_role(auth.uid(), 'admin'));
