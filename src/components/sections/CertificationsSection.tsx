import { useEffect, useRef } from 'react';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { Award, ExternalLink, Calendar } from 'lucide-react';
import { supabase } from '@/integrations/supabase/client';
import { useQuery } from '@tanstack/react-query';

gsap.registerPlugin(ScrollTrigger);

interface Certification {
  id: string;
  title: string;
  issuer: string;
  issue_date: string | null;
  expiry_date: string | null;
  credential_id: string | null;
  credential_url: string | null;
  display_order: number | null;
}

const CertificationsSection = () => {
  const sectionRef = useRef<HTMLElement>(null);
  const titleRef = useRef<HTMLDivElement>(null);

  const { data: certifications = [] } = useQuery({
    queryKey: ['certifications'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('certifications')
        .select('*')
        .order('display_order', { ascending: true });
      if (error) throw error;
      return data as Certification[];
    },
  });

  useEffect(() => {
    const ctx = gsap.context(() => {
      gsap.fromTo(
        titleRef.current,
        { opacity: 0, y: 50 },
        {
          opacity: 1,
          y: 0,
          duration: 0.8,
          scrollTrigger: {
            trigger: sectionRef.current,
            start: 'top 80%',
          },
        }
      );

      gsap.fromTo(
        '.cert-card',
        { opacity: 0, y: 60, scale: 0.95 },
        {
          opacity: 1,
          y: 0,
          scale: 1,
          duration: 0.7,
          stagger: 0.15,
          ease: 'power3.out',
          scrollTrigger: {
            trigger: '.cert-grid',
            start: 'top 85%',
            toggleActions: 'play none none reverse',
          },
        }
      );
    }, sectionRef);

    return () => ctx.revert();
  }, [certifications]);

  const formatDate = (dateStr: string | null) => {
    if (!dateStr) return '';
    const date = new Date(dateStr);
    return date.toLocaleDateString('en-US', { month: 'short', year: 'numeric' });
  };

  if (certifications.length === 0) return null;

  return (
    <section id="certifications" ref={sectionRef} className="section-container">
      <div className="container mx-auto px-4">
        <div ref={titleRef} className="text-center mb-16 opacity-0">
          <h2 className="section-title">Certifications & Achievements</h2>
          <p className="text-muted-foreground max-w-2xl mx-auto">
            Badges of honor earned through dedication and skill.
          </p>
        </div>

        <div className="cert-grid grid sm:grid-cols-2 lg:grid-cols-3 gap-6 max-w-5xl mx-auto">
          {certifications.map((cert) => (
            <div
              key={cert.id}
              className="cert-card card-glow rounded-2xl p-6 flex flex-col opacity-0 group"
            >
              <div className="flex items-start gap-4 mb-4">
                <div className="p-3 rounded-xl bg-primary/10 border border-primary/20 shrink-0">
                  <Award className="w-6 h-6 text-primary" />
                </div>
                <div className="min-w-0">
                  <h3 className="font-display font-bold text-lg leading-tight text-glow">
                    {cert.title}
                  </h3>
                  <p className="text-primary font-heading text-sm mt-1">{cert.issuer}</p>
                </div>
              </div>

              <div className="flex-1" />

              <div className="space-y-2 mt-4 pt-4 border-t border-border">
                {cert.issue_date && (
                  <p className="flex items-center gap-2 text-xs text-muted-foreground">
                    <Calendar className="w-3.5 h-3.5" />
                    {formatDate(cert.issue_date)}
                    {cert.expiry_date && ` – ${formatDate(cert.expiry_date)}`}
                  </p>
                )}
                {cert.credential_id && (
                  <p className="text-xs text-muted-foreground truncate">
                    ID: {cert.credential_id}
                  </p>
                )}
                {cert.credential_url && (
                  <a
                    href={cert.credential_url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="inline-flex items-center gap-1.5 text-xs text-primary hover:underline font-medium"
                  >
                    <ExternalLink className="w-3.5 h-3.5" />
                    View Credential
                  </a>
                )}
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default CertificationsSection;
