
-- Drop ALL existing policies and recreate as explicitly PERMISSIVE

-- PROFILES
DROP POLICY IF EXISTS "Public can view limited profile data" ON public.profiles;
DROP POLICY IF EXISTS "Admin can manage profiles" ON public.profiles;
CREATE POLICY "Public can view limited profile data" ON public.profiles AS PERMISSIVE FOR SELECT USING (true);
CREATE POLICY "Admin can manage profiles" ON public.profiles AS PERMISSIVE FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (public.has_role(auth.uid(), 'admin'::app_role));

-- SKILLS
DROP POLICY IF EXISTS "Public can view skills" ON public.skills;
DROP POLICY IF EXISTS "Admin can manage skills" ON public.skills;
CREATE POLICY "Public can view skills" ON public.skills AS PERMISSIVE FOR SELECT USING (true);
CREATE POLICY "Admin can manage skills" ON public.skills AS PERMISSIVE FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (public.has_role(auth.uid(), 'admin'::app_role));

-- PROJECTS
DROP POLICY IF EXISTS "Public can view projects" ON public.projects;
DROP POLICY IF EXISTS "Admin can manage projects" ON public.projects;
CREATE POLICY "Public can view projects" ON public.projects AS PERMISSIVE FOR SELECT USING (true);
CREATE POLICY "Admin can manage projects" ON public.projects AS PERMISSIVE FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (public.has_role(auth.uid(), 'admin'::app_role));

-- EDUCATION
DROP POLICY IF EXISTS "Public can view education" ON public.education;
DROP POLICY IF EXISTS "Admin can manage education" ON public.education;
CREATE POLICY "Public can view education" ON public.education AS PERMISSIVE FOR SELECT USING (true);
CREATE POLICY "Admin can manage education" ON public.education AS PERMISSIVE FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (public.has_role(auth.uid(), 'admin'::app_role));

-- EXPERIENCE
DROP POLICY IF EXISTS "Public can view experience" ON public.experience;
DROP POLICY IF EXISTS "Admin can manage experience" ON public.experience;
CREATE POLICY "Public can view experience" ON public.experience AS PERMISSIVE FOR SELECT USING (true);
CREATE POLICY "Admin can manage experience" ON public.experience AS PERMISSIVE FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (public.has_role(auth.uid(), 'admin'::app_role));

-- CERTIFICATIONS
DROP POLICY IF EXISTS "Public can view certifications" ON public.certifications;
DROP POLICY IF EXISTS "Admin can manage certifications" ON public.certifications;
CREATE POLICY "Public can view certifications" ON public.certifications AS PERMISSIVE FOR SELECT USING (true);
CREATE POLICY "Admin can manage certifications" ON public.certifications AS PERMISSIVE FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (public.has_role(auth.uid(), 'admin'::app_role));

-- BLOG_POSTS
DROP POLICY IF EXISTS "Public can view published blog posts" ON public.blog_posts;
DROP POLICY IF EXISTS "Admin can manage blog posts" ON public.blog_posts;
CREATE POLICY "Public can view published blog posts" ON public.blog_posts AS PERMISSIVE FOR SELECT USING (is_published = true);
CREATE POLICY "Admin can manage blog posts" ON public.blog_posts AS PERMISSIVE FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (public.has_role(auth.uid(), 'admin'::app_role));

-- QUOTES
DROP POLICY IF EXISTS "Public can view quotes" ON public.quotes;
DROP POLICY IF EXISTS "Admin can manage quotes" ON public.quotes;
CREATE POLICY "Public can view quotes" ON public.quotes AS PERMISSIVE FOR SELECT USING (true);
CREATE POLICY "Admin can manage quotes" ON public.quotes AS PERMISSIVE FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (public.has_role(auth.uid(), 'admin'::app_role));

-- USER_ROLES
DROP POLICY IF EXISTS "Users can view their own roles" ON public.user_roles;
DROP POLICY IF EXISTS "Admins can manage all roles" ON public.user_roles;
CREATE POLICY "Users can view their own roles" ON public.user_roles AS PERMISSIVE FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "Admins can manage all roles" ON public.user_roles AS PERMISSIVE FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (public.has_role(auth.uid(), 'admin'::app_role));
