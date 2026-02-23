import { Helmet } from 'react-helmet-async';

interface SEOHeadProps {
  title?: string;
  description?: string;
  canonicalUrl?: string;
  ogImage?: string;
  jsonLd?: Record<string, unknown>;
}

const defaults = {
  title: 'Syed Maroof Hussain | BTech Student & Web Developer',
  description:
    'Portfolio of Syed Maroof Hussain – BTech student at Integral University specializing in Cloud Computing & AI. Web developer and tech enthusiast from Lucknow, India.',
  ogImage: 'https://lovable.dev/opengraph-image-p98pqg.png',
  siteUrl: 'https://solo-quest-folio.lovable.app',
};

const SEOHead = ({
  title = defaults.title,
  description = defaults.description,
  canonicalUrl,
  ogImage = defaults.ogImage,
  jsonLd,
}: SEOHeadProps) => {
  const canonical = canonicalUrl ?? defaults.siteUrl;

  const defaultJsonLd = {
    '@context': 'https://schema.org',
    '@type': 'Person',
    name: 'Syed Maroof Hussain',
    url: defaults.siteUrl,
    jobTitle: 'BTech Student & Web Developer',
    alumniOf: {
      '@type': 'CollegeOrUniversity',
      name: 'Integral University',
    },
    address: {
      '@type': 'PostalAddress',
      addressLocality: 'Lucknow',
      addressCountry: 'IN',
    },
    knowsAbout: ['Cloud Computing', 'AI', 'Web Development', 'React', 'TypeScript'],
  };

  return (
    <Helmet>
      <title>{title}</title>
      <meta name="description" content={description} />
      <link rel="canonical" href={canonical} />

      {/* Open Graph */}
      <meta property="og:title" content={title} />
      <meta property="og:description" content={description} />
      <meta property="og:url" content={canonical} />
      <meta property="og:image" content={ogImage} />

      {/* Twitter */}
      <meta name="twitter:title" content={title} />
      <meta name="twitter:description" content={description} />
      <meta name="twitter:image" content={ogImage} />

      {/* JSON-LD */}
      <script type="application/ld+json">
        {JSON.stringify(jsonLd ?? defaultJsonLd)}
      </script>
    </Helmet>
  );
};

export default SEOHead;
