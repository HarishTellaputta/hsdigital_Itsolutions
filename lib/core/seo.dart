import 'dart:html' as html;

class SeoHelper {
  static void setPageSeo({
    required String title,
    required String description,
    required String canonicalUrl,
    required String ogTitle,
    required String ogDescription,
    required String ogUrl,
    String? schemaJson,
  }) {
    html.document.title = title;

    _setMeta(
      name: 'description',
      content: description,
    );

    _setMeta(
      name: 'robots',
      content: 'index, follow',
    );

    _setCanonical(canonicalUrl);

    _setMeta(
      property: 'og:type',
      content: 'website',
    );

    _setMeta(
      property: 'og:title',
      content: ogTitle,
    );

    _setMeta(
      property: 'og:description',
      content: ogDescription,
    );

    _setMeta(
      property: 'og:url',
      content: ogUrl,
    );

    _setMeta(
      property: 'og:site_name',
      content: 'HS Digital IT Solutions',
    );

    _setMeta(
      name: 'twitter:card',
      content: 'summary_large_image',
    );

    _setMeta(
      name: 'twitter:title',
      content: ogTitle,
    );

    _setMeta(
      name: 'twitter:description',
      content: ogDescription,
    );

    if (schemaJson != null) {
      _setSchema(schemaJson);
    }
  }

  static void _setMeta({
    String? name,
    String? property,
    required String content,
  }) {
    String selector;

    if (name != null) {
      selector = 'meta[name="$name"]';
    } else {
      selector = 'meta[property="$property"]';
    }

    final existing = html.document.querySelector(selector);

    if (existing != null) {
      existing.setAttribute('content', content);
      return;
    }

    final meta = html.MetaElement();

    if (name != null) {
      meta.setAttribute('name', name);
    }

    if (property != null) {
      meta.setAttribute('property', property);
    }

    meta.setAttribute('content', content);

    html.document.head!.append(meta);
  }

  static void _setCanonical(String url) {
    final existing =
        html.document.querySelector('link[rel="canonical"]');

    if (existing != null) {
      existing.setAttribute('href', url);
      return;
    }

    final link = html.LinkElement();

    link.setAttribute('rel', 'canonical');
    link.setAttribute('href', url);

    html.document.head!.append(link);
  }

  static void _setSchema(String schemaJson) {
    final oldSchema =
        html.document.querySelector('script[data-hs-seo-schema]');

    oldSchema?.remove();

    final script = html.ScriptElement();

    script.type = 'application/ld+json';
    script.setAttribute('data-hs-seo-schema', 'true');
    script.text = schemaJson;

    html.document.head!.append(script);
  }
}