```App.tsx
import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { HomePage } from './pages/HomePage';
import { AboutPage } from './pages/AboutPage';
import { BlogPage } from './pages/BlogPage';
import { BlogPostPage } from './pages/BlogPostPage';
import { ContactPage } from './pages/ContactPage';
import { ConfirmationPage } from './pages/ConfirmationPage';
function App() {
  return <Router>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/about" element={<AboutPage />} />
        <Route path="/blog" element={<BlogPage />} />
        <Route path="/blog/:slug" element={<BlogPostPage />} />
        <Route path="/contact" element={<ContactPage />} />
        <Route path="/confirmation" element={<ConfirmationPage />} />
      </Routes>
    </Router>;
}
export { App };
```
```components/BlogGrid.tsx
import React from 'react'
import { BlogPostCard, BlogPost } from './BlogPostCard'
const SAMPLE_POSTS: BlogPost[] = [
  {
    id: '1',
    title: "When your B2B site stops being 'just a website'",
    category: 'Strategy',
    excerpt:
      "Most B2B companies start with a simple website. But as you grow, that website becomes a bottleneck. Here's how to recognize the signs and what to do next.",
    date: 'Dec 15, 2024',
    readTime: '8 min read',
  },
  {
    id: '2',
    title: 'How to structure case studies for trust and leads',
    category: 'Content',
    excerpt:
      'Case studies are powerful, but only if structured correctly. Learn the framework that converts prospects into qualified leads.',
    date: 'Dec 10, 2024',
    readTime: '6 min read',
  },
  {
    id: '3',
    title: 'Knowledge base vs. help center vs. docs: what to build first',
    category: 'Knowledge Management',
    excerpt:
      "These terms are often used interchangeably, but they serve different purposes. Here's how to decide what your team needs.",
    date: 'Dec 5, 2024',
    readTime: '7 min read',
  },
  {
    id: '4',
    title: 'CMS migration without chaos: a phased roadmap',
    category: 'Technical',
    excerpt:
      "Migrating your CMS doesn't have to be a nightmare. Follow this phased approach to minimize risk and downtime.",
    date: 'Nov 28, 2024',
    readTime: '10 min read',
  },
  {
    id: '5',
    title: 'Content audit checklist for B2B websites',
    category: 'Strategy',
    excerpt:
      'Before rebuilding your website, you need to know what you have. Use this checklist to audit your content effectively.',
    date: 'Nov 20, 2024',
    readTime: '5 min read',
  },
  {
    id: '6',
    title: 'Why your support team needs a knowledge hub',
    category: 'Knowledge Management',
    excerpt:
      "Support teams waste hours answering the same questions. A knowledge hub changes that. Here's how to build one.",
    date: 'Nov 15, 2024',
    readTime: '6 min read',
  },
]
export function BlogGrid() {
  return (
    <section className="py-20 bg-[#edeef7]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {SAMPLE_POSTS.map((post, index) => (
            <BlogPostCard key={post.id} post={post} index={index} />
          ))}
        </div>
      </div>
    </section>
  )
}

```
```components/BlogHero.tsx
import React from 'react'
import { motion } from 'framer-motion'
export function BlogHero() {
  return (
    <section className="relative w-full bg-[#151927] text-[#dddfed] pt-32 pb-20 overflow-hidden">
      {/* Background decoration */}
      <div className="absolute top-0 right-0 w-1/3 h-full bg-gradient-to-l from-[#20B7F3]/5 to-transparent pointer-events-none" />
      <div className="absolute bottom-0 left-0 w-1/4 h-1/2 bg-gradient-to-t from-[#20B7F3]/5 to-transparent pointer-events-none" />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="max-w-3xl">
          <motion.div
            initial={{
              opacity: 0,
              y: 20,
            }}
            animate={{
              opacity: 1,
              y: 0,
            }}
            transition={{
              duration: 0.6,
            }}
          >
            <span className="inline-block py-1 px-3 rounded-full bg-[#20B7F3]/10 text-[#20B7F3] font-mono text-sm mb-6 border border-[#20B7F3]/20">
              Blog
            </span>
            <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold text-white leading-[1.1] mb-6 tracking-tight font-figtree">
              Insights & Resources
            </h1>
            <p className="text-lg md:text-xl text-[#dddfed]/80 max-w-2xl leading-relaxed">
              Practical guides on building content platforms, managing B2B
              websites, and scaling your knowledge hub.
            </p>
          </motion.div>
        </div>
      </div>
    </section>
  )
}

```
```components/BlogPostCard.tsx
import React from 'react'
import { motion } from 'framer-motion'
import { Clock, Calendar } from 'lucide-react'
import { Link } from 'react-router-dom'
export interface BlogPost {
  id: string
  title: string
  excerpt: string
  category: string
  date: string
  readTime: string
  imageUrl?: string
}
interface BlogPostCardProps {
  post: BlogPost
  index: number
}
export function BlogPostCard({ post, index }: BlogPostCardProps) {
  return (
    <Link to={`/blog/${post.id}`} className="block h-full">
      <motion.article
        initial={{
          opacity: 0,
          y: 20,
        }}
        whileInView={{
          opacity: 1,
          y: 0,
        }}
        viewport={{
          once: true,
        }}
        transition={{
          delay: index * 0.1,
          duration: 0.5,
        }}
        whileHover={{
          y: -4,
        }}
        className="bg-white rounded-xl overflow-hidden shadow-sm hover:shadow-md transition-all duration-300 border border-gray-100 flex flex-col h-full group cursor-pointer"
      >
        {/* Image Placeholder */}
        <div className="aspect-video w-full bg-gray-100 relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-br from-[#151927]/5 to-[#151927]/10 group-hover:scale-105 transition-transform duration-500" />
          {/* Optional: Actual image would go here */}
          <div className="absolute top-4 left-4">
            <span className="inline-block px-3 py-1 rounded-full bg-[#20B7F3]/10 text-[#20B7F3] text-xs font-bold uppercase tracking-wider border border-[#20B7F3]/20">
              {post.category}
            </span>
          </div>
        </div>

        <div className="p-6 flex flex-col flex-1">
          <div className="flex items-center text-xs text-gray-500 mb-3 space-x-4 font-mono">
            <div className="flex items-center">
              <Calendar className="w-3 h-3 mr-1.5" />
              {post.date}
            </div>
            <div className="flex items-center">
              <Clock className="w-3 h-3 mr-1.5" />
              {post.readTime}
            </div>
          </div>

          <h3 className="text-xl font-bold text-[#151927] mb-3 group-hover:text-[#20B7F3] transition-colors line-clamp-2 font-figtree">
            {post.title}
          </h3>

          <p className="text-gray-600 text-sm leading-relaxed mb-6 line-clamp-3 flex-1">
            {post.excerpt}
          </p>

          <div className="mt-auto pt-4 border-t border-gray-100">
            <span className="text-sm font-bold text-[#151927] group-hover:text-[#20B7F3] transition-colors flex items-center">
              Read article
              <svg
                className="w-4 h-4 ml-2 transform group-hover:translate-x-1 transition-transform"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M17 8l4 4m0 0l-4 4m4-4H3"
                />
              </svg>
            </span>
          </div>
        </div>
      </motion.article>
    </Link>
  )
}

```
```components/CaseStudiesSection.tsx
import React from 'react'
import { motion } from 'framer-motion'
import { ArrowRight, Quote } from 'lucide-react'
import { Button } from './ui/Button'
const caseStudies = [
  {
    title: 'Enterprise Knowledge Hub Migration',
    client: 'B2B SaaS Company',
    description:
      'Migrated a legacy help center to a modern, searchable knowledge platform. Reduced support tickets by 40% in the first quarter.',
    tags: ['Orchard CMS', 'Content Migration', 'Search'],
  },
  {
    title: 'Marketing Website Rebuild',
    client: 'Growing Tech Startup',
    description:
      'Rebuilt marketing site with modular content blocks and a CMS that the marketing team could confidently manage without developer help.',
    tags: ['React', 'Headless CMS', 'Performance'],
  },
]
const testimonials = [
  {
    quote:
      "Márk didn't just build us a website—he built us a system we can actually maintain. Our marketing team finally feels confident making updates without breaking things.",
    author: 'Sarah Chen',
    role: 'VP of Marketing',
    company: 'TechCorp',
  },
  {
    quote:
      "The knowledge hub Márk built reduced our support load significantly. More importantly, he trained our team so well that we've been able to expand it ourselves.",
    author: 'James Wilson',
    role: 'Head of Customer Success',
    company: 'CloudSolutions',
  },
]
export function CaseStudiesSection() {
  return (
    <section className="py-24 bg-[#edeef7]" id="work">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Section Header */}
        <div className="text-center mb-16">
          <motion.div
            initial={{
              opacity: 0,
              y: 20,
            }}
            whileInView={{
              opacity: 1,
              y: 0,
            }}
            viewport={{
              once: true,
            }}
          >
            <h2 className="text-3xl md:text-4xl font-bold text-[#151927] mb-4 font-figtree">
              Recent Projects & Client Feedback
            </h2>
            <p className="text-lg text-[#151927]/70 max-w-2xl mx-auto">
              A selection of recent work and what clients have to say about the
              results.
            </p>
          </motion.div>
        </div>

        {/* Case Studies */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-16">
          {caseStudies.map((study, index) => (
            <motion.div
              key={index}
              initial={{
                opacity: 0,
                y: 20,
              }}
              whileInView={{
                opacity: 1,
                y: 0,
              }}
              viewport={{
                once: true,
              }}
              transition={{
                delay: index * 0.1,
              }}
              className="bg-white rounded-xl p-8 shadow-sm border border-gray-100 hover:shadow-md transition-shadow group cursor-pointer"
            >
              <div className="flex flex-wrap gap-2 mb-4">
                {study.tags.map((tag, idx) => (
                  <span
                    key={idx}
                    className="px-3 py-1 rounded-full bg-[#20B7F3]/10 text-[#20B7F3] text-xs font-medium border border-[#20B7F3]/20"
                  >
                    {tag}
                  </span>
                ))}
              </div>
              <h3 className="text-xl font-bold text-[#151927] mb-2 font-figtree group-hover:text-[#20B7F3] transition-colors">
                {study.title}
              </h3>
              <p className="text-sm text-[#151927]/50 mb-3 font-mono">
                {study.client}
              </p>
              <p className="text-[#151927]/70 leading-relaxed text-sm mb-4">
                {study.description}
              </p>
              <div className="inline-flex items-center text-sm font-medium text-[#20B7F3] group-hover:text-[#1aa3d9] transition-colors">
                Read case study
                <ArrowRight className="ml-2 w-4 h-4 group-hover:translate-x-1 transition-transform" />
              </div>
            </motion.div>
          ))}
        </div>

        {/* Testimonials */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mb-12">
          {testimonials.map((testimonial, index) => (
            <motion.div
              key={index}
              initial={{
                opacity: 0,
                y: 20,
              }}
              whileInView={{
                opacity: 1,
                y: 0,
              }}
              viewport={{
                once: true,
              }}
              transition={{
                delay: 0.2 + index * 0.1,
              }}
              className="bg-white rounded-xl p-8 shadow-sm border border-gray-100 relative"
            >
              <Quote className="w-8 h-8 text-[#20B7F3]/20 mb-4" />
              <p className="text-[#151927]/80 leading-relaxed mb-6 italic">
                "{testimonial.quote}"
              </p>
              <div className="border-t border-gray-100 pt-4">
                <p className="font-bold text-[#151927] font-figtree">
                  {testimonial.author}
                </p>
                <p className="text-sm text-[#151927]/60">
                  {testimonial.role}, {testimonial.company}
                </p>
              </div>
            </motion.div>
          ))}
        </div>

        {/* CTA */}
        <motion.div
          initial={{
            opacity: 0,
          }}
          whileInView={{
            opacity: 1,
          }}
          viewport={{
            once: true,
          }}
          transition={{
            delay: 0.4,
          }}
          className="text-center"
        >
          <p className="text-sm text-[#151927]/60 mb-6">
            More case studies and detailed results available upon request
          </p>
          <Button variant="primary" size="lg">
            Discuss your project
          </Button>
        </motion.div>
      </div>
    </section>
  )
}

```
```components/ContactForm.tsx
import React, { useState } from 'react'
import { motion } from 'framer-motion'
import { Button } from './ui/Button'
import { CheckCircle, AlertCircle } from 'lucide-react'
export function ContactForm() {
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [submitStatus, setSubmitStatus] = useState<
    'idle' | 'success' | 'error'
  >('idle')
  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    setIsSubmitting(true)
    // Simulate API call
    await new Promise((resolve) => setTimeout(resolve, 1500))
    setIsSubmitting(false)
    setSubmitStatus('success')
    // In a real app, you would handle the actual submission here
  }
  if (submitStatus === 'success') {
    return (
      <motion.div
        initial={{
          opacity: 0,
          scale: 0.95,
        }}
        animate={{
          opacity: 1,
          scale: 1,
        }}
        className="bg-white rounded-xl shadow-lg p-8 md:p-12 text-center border border-gray-100"
      >
        <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-6">
          <CheckCircle className="w-8 h-8 text-green-600" />
        </div>
        <h3 className="text-2xl font-bold font-figtree text-[#151927] mb-4">
          Message sent!
        </h3>
        <p className="text-gray-600 mb-8">
          Thanks for reaching out. I'll get back to you within 1 business day.
        </p>
        <Button variant="outline" onClick={() => setSubmitStatus('idle')}>
          Send another message
        </Button>
      </motion.div>
    )
  }
  return (
    <motion.div
      initial={{
        opacity: 0,
        y: 20,
      }}
      animate={{
        opacity: 1,
        y: 0,
      }}
      transition={{
        duration: 0.5,
      }}
      className="bg-white rounded-xl shadow-lg p-8 md:p-12 border border-gray-100"
    >
      <form onSubmit={handleSubmit} className="space-y-6">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div className="space-y-2">
            <label
              htmlFor="name"
              className="block text-sm font-medium text-[#151927]"
            >
              Name <span className="text-red-500">*</span>
            </label>
            <input
              type="text"
              id="name"
              required
              className="w-full px-4 py-3 rounded-lg border border-gray-200 focus:border-[#20B7F3] focus:ring-2 focus:ring-[#20B7F3]/20 outline-none transition-all font-dm-sans placeholder:text-gray-400"
              placeholder="John Doe"
            />
          </div>

          <div className="space-y-2">
            <label
              htmlFor="email"
              className="block text-sm font-medium text-[#151927]"
            >
              Work Email <span className="text-red-500">*</span>
            </label>
            <input
              type="email"
              id="email"
              required
              className="w-full px-4 py-3 rounded-lg border border-gray-200 focus:border-[#20B7F3] focus:ring-2 focus:ring-[#20B7F3]/20 outline-none transition-all font-dm-sans placeholder:text-gray-400"
              placeholder="john@company.com"
            />
          </div>
        </div>

        <div className="space-y-2">
          <label
            htmlFor="company"
            className="block text-sm font-medium text-[#151927]"
          >
            Company <span className="text-red-500">*</span>
          </label>
          <input
            type="text"
            id="company"
            required
            className="w-full px-4 py-3 rounded-lg border border-gray-200 focus:border-[#20B7F3] focus:ring-2 focus:ring-[#20B7F3]/20 outline-none transition-all font-dm-sans placeholder:text-gray-400"
            placeholder="Company Name Ltd."
          />
        </div>

        <div className="space-y-2">
          <label
            htmlFor="interest"
            className="block text-sm font-medium text-[#151927]"
          >
            What are you looking for?
          </label>
          <div className="relative">
            <select
              id="interest"
              className="w-full px-4 py-3 rounded-lg border border-gray-200 focus:border-[#20B7F3] focus:ring-2 focus:ring-[#20B7F3]/20 outline-none transition-all font-dm-sans appearance-none bg-white"
              defaultValue=""
            >
              <option value="" disabled>
                Select an option
              </option>
              <option value="website">Website Rebuild</option>
              <option value="knowledge-hub">Knowledge Hub / Help Center</option>
              <option value="roadmap">Content Architecture & Roadmap</option>
              <option value="other">Other</option>
            </select>
            <div className="absolute right-4 top-1/2 -translate-y-1/2 pointer-events-none">
              <svg
                className="w-4 h-4 text-gray-500"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M19 9l-7 7-7-7"
                />
              </svg>
            </div>
          </div>
        </div>

        <div className="space-y-2">
          <label
            htmlFor="message"
            className="block text-sm font-medium text-[#151927]"
          >
            Message <span className="text-red-500">*</span>
          </label>
          <textarea
            id="message"
            required
            rows={5}
            className="w-full px-4 py-3 rounded-lg border border-gray-200 focus:border-[#20B7F3] focus:ring-2 focus:ring-[#20B7F3]/20 outline-none transition-all font-dm-sans placeholder:text-gray-400 resize-none"
            placeholder="Tell me about your project goals and timeline..."
          />
        </div>

        <div className="pt-2">
          <Button
            type="submit"
            variant="primary"
            className="w-full justify-center"
            disabled={isSubmitting}
          >
            {isSubmitting ? (
              <span className="flex items-center">
                <svg
                  className="animate-spin -ml-1 mr-3 h-5 w-5 text-[#151927]"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                >
                  <circle
                    className="opacity-25"
                    cx="12"
                    cy="12"
                    r="10"
                    stroke="currentColor"
                    strokeWidth="4"
                  ></circle>
                  <path
                    className="opacity-75"
                    fill="currentColor"
                    d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                  ></path>
                </svg>
                Sending...
              </span>
            ) : (
              'Send Message'
            )}
          </Button>
        </div>

        <p className="text-xs text-center text-gray-500 mt-4">
          I respect your privacy. No spam, ever.
        </p>
      </form>
    </motion.div>
  )
}

```
```components/CTASection.tsx
import React from 'react'
import { motion } from 'framer-motion'
import { Button } from './ui/Button'
export function CTASection() {
  return (
    <section className="py-24 bg-[#edeef7]">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <motion.div
          initial={{
            opacity: 0,
            y: 20,
          }}
          whileInView={{
            opacity: 1,
            y: 0,
          }}
          viewport={{
            once: true,
          }}
        >
          <h2 className="text-3xl md:text-5xl font-bold text-[#151927] mb-6">
            Ready to make your content platform predictable again?
          </h2>
          <p className="text-lg text-[#151927]/70 mb-10">
            No obligation. I'll share a clear next-step recommendation based on
            your current situation.
          </p>

          <div className="flex flex-col items-center gap-4">
            <Button
              variant="primary"
              size="lg"
              withArrow
              className="w-full sm:w-auto"
            >
              Book a strategy call
            </Button>
            <p className="text-sm text-[#151927]/50">
              Direct access to Márk's calendar
            </p>
          </div>
        </motion.div>
      </div>
    </section>
  )
}

```
```components/CTAWithFAQSection.tsx
import React, { useState } from 'react'
import { motion } from 'framer-motion'
import { Button } from './ui/Button'
import { Plus, Minus } from 'lucide-react'
import { useNavigate } from 'react-router-dom'
const faqs = [
  {
    question: 'How do you handle project scope and pricing?',
    answer:
      'I start with a discovery call to understand your needs, then provide a fixed-price proposal for a defined scope. For larger projects, I break them into phases so you can see value early and adjust as needed.',
  },
  {
    question: "What's your typical timeline?",
    answer:
      "Most projects take 8-12 weeks from kickoff to launch, depending on complexity. I work in 2-week sprints with regular check-ins, so you'll see progress throughout.",
  },
  {
    question: 'Do you work with internal teams?',
    answer:
      'Absolutely. I often collaborate with your marketing, design, or development teams. I can also train your team to manage the platform after launch.',
  },
  {
    question: 'What if we need ongoing support?',
    answer:
      'I offer monthly retainers for ongoing maintenance, improvements, and support. Many clients start with a project, then move to a retainer for peace of mind.',
  },
  {
    question: 'How many projects do you take at once?',
    answer:
      'I limit myself to 2-3 active projects at a time. This ensures I can give each client the focus and responsiveness they deserve.',
  },
]
export function CTAWithFAQSection() {
  const [openIndex, setOpenIndex] = useState<number | null>(0)
  const navigate = useNavigate()
  return (
    <section className="py-24 bg-[#151927] text-[#dddfed]">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* CTA */}
        <motion.div
          initial={{
            opacity: 0,
            y: 20,
          }}
          whileInView={{
            opacity: 1,
            y: 0,
          }}
          viewport={{
            once: true,
          }}
          className="text-center mb-16"
        >
          <h2 className="text-3xl md:text-4xl font-bold text-white mb-6 font-figtree leading-tight">
            Ready to build a content platform that actually works?
          </h2>
          <p className="text-lg text-[#dddfed]/70 mb-8 leading-relaxed max-w-2xl mx-auto">
            Let's talk about your content challenges and what success looks
            like. No pressure, no sales pitch—just a straightforward
            conversation.
          </p>

          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Button
              variant="primary"
              size="lg"
              onClick={() => navigate('/contact')}
            >
              Book a strategy call
            </Button>
            <Button
              variant="ghost"
              size="lg"
              className="text-white hover:bg-white/10 hover:text-white border-white/20 hover:border-white/40"
              onClick={() => navigate('/about')}
            >
              Learn more about me
            </Button>
          </div>
        </motion.div>

        {/* FAQ */}
        <motion.div
          initial={{
            opacity: 0,
            y: 20,
          }}
          whileInView={{
            opacity: 1,
            y: 0,
          }}
          viewport={{
            once: true,
          }}
          transition={{
            delay: 0.2,
          }}
        >
          <h3 className="text-xl font-bold text-white mb-8 text-center font-figtree">
            Common questions
          </h3>

          <div className="border border-white/10 rounded-lg overflow-hidden">
            {faqs.map((faq, index) => (
              <div key={index}>
                <button
                  onClick={() =>
                    setOpenIndex(openIndex === index ? null : index)
                  }
                  className="w-full px-6 py-4 flex items-center justify-between text-left hover:bg-white/5 transition-colors"
                >
                  <span className="font-medium text-white pr-4">
                    {faq.question}
                  </span>
                  {openIndex === index ? (
                    <Minus className="w-5 h-5 text-[#20B7F3] flex-shrink-0" />
                  ) : (
                    <Plus className="w-5 h-5 text-[#dddfed]/40 flex-shrink-0" />
                  )}
                </button>
                {openIndex === index && (
                  <motion.div
                    initial={{
                      height: 0,
                      opacity: 0,
                    }}
                    animate={{
                      height: 'auto',
                      opacity: 1,
                    }}
                    exit={{
                      height: 0,
                      opacity: 0,
                    }}
                    transition={{
                      duration: 0.2,
                    }}
                    className="px-6 pb-4 border-t border-white/10"
                  >
                    <p className="text-[#dddfed]/70 leading-relaxed pt-4">
                      {faq.answer}
                    </p>
                  </motion.div>
                )}
                {index < faqs.length - 1 && (
                  <div className="border-t border-white/10" />
                )}
              </div>
            ))}
          </div>
        </motion.div>
      </div>
    </section>
  )
}

```
```components/Hero.tsx
import React from 'react'
import { motion } from 'framer-motion'
import { Button } from './ui/Button'
import { Code2, Database, BookOpen, Wrench } from 'lucide-react'
const expertise = [
  {
    icon: Code2,
    text: '10+ years building .NET web platforms',
  },
  {
    icon: Database,
    text: 'Deep CMS + content modeling expertise',
  },
  {
    icon: BookOpen,
    text: 'Content-heavy B2B sites + knowledge hubs',
  },
  {
    icon: Wrench,
    text: 'Long-term maintainability focus',
  },
]
export function Hero() {
  return (
    <section className="relative w-full bg-[#151927] text-[#dddfed] pt-32 pb-20 lg:pt-40 lg:pb-32 overflow-hidden">
      {/* Background decoration */}
      <div className="absolute top-0 right-0 w-1/3 h-full bg-gradient-to-l from-[#20B7F3]/5 to-transparent pointer-events-none" />
      <div className="absolute bottom-0 left-0 w-1/4 h-1/2 bg-gradient-to-t from-[#20B7F3]/5 to-transparent pointer-events-none" />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">
          {/* Content Column */}
          <motion.div
            className="lg:col-span-7"
            initial={{
              opacity: 0,
              y: 20,
            }}
            animate={{
              opacity: 1,
              y: 0,
            }}
            transition={{
              duration: 0.6,
            }}
          >
            <span className="inline-block py-1 px-3 rounded-full bg-[#20B7F3]/10 text-[#20B7F3] font-mono text-sm mb-6 border border-[#20B7F3]/20">
              Independent B2B Software Partner
            </span>
            <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold text-white leading-[1.1] mb-6 tracking-tight">
              Turn your B2B content into a{' '}
              <span className="text-[#20B7F3]">scalable website</span> and
              knowledge hub.
            </h1>
            <p className="text-lg md:text-xl text-[#dddfed]/80 mb-10 max-w-2xl leading-relaxed">
              I help growing B2B teams move beyond "just a website" with a
              content platform that is easy to manage, built to last, and
              designed to support sales and support.
            </p>

            <div className="flex flex-col sm:flex-row gap-4 mb-16">
              <Button variant="primary" size="lg" withArrow>
                Book a strategy call
              </Button>
              <Button
                variant="ghost"
                size="lg"
                className="text-white hover:bg-white/10 hover:text-white border-white/20 hover:border-white/40"
              >
                See case studies
              </Button>
            </div>

            <motion.div
              initial={{
                opacity: 0,
              }}
              animate={{
                opacity: 1,
              }}
              transition={{
                delay: 0.4,
                duration: 0.6,
              }}
              className="border-t border-white/10 pt-6"
            >
              <p className="text-sm font-mono text-[#dddfed]/60 mb-4 uppercase tracking-wider">
                Background & Expertise
              </p>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                {expertise.map((item, index) => (
                  <div key={index} className="flex items-center gap-2">
                    <item.icon className="w-4 h-4 text-[#20B7F3] flex-shrink-0" />
                    <span className="text-sm text-[#dddfed]/70">
                      {item.text}
                    </span>
                  </div>
                ))}
              </div>
            </motion.div>
          </motion.div>

          {/* Image Column */}
          <motion.div
            className="lg:col-span-5 relative"
            initial={{
              opacity: 0,
              x: 20,
            }}
            animate={{
              opacity: 1,
              x: 0,
            }}
            transition={{
              delay: 0.2,
              duration: 0.8,
            }}
          >
            {/* Decorative elements behind image */}
            <div className="absolute -top-4 -right-4 w-full h-full border-2 border-[#20B7F3]/20 rounded-2xl z-0 hidden md:block" />
            <div className="absolute -bottom-4 -left-4 w-24 h-24 bg-[#20B7F3]/10 rounded-full blur-2xl z-0" />

            {/* Image Container */}
            <div className="relative z-10 rounded-2xl overflow-hidden shadow-2xl border border-white/10 bg-[#1a1f30] aspect-[4/5] md:aspect-square lg:aspect-[4/5] max-w-md mx-auto lg:mx-0">
              <div className="absolute inset-0 bg-gradient-to-t from-[#151927]/80 via-transparent to-transparent z-20 opacity-60" />
              <img
                src="https://markbartha.com/mediatheme/images/profile.jpg"
                alt="Márk Bartha"
                className="w-full h-full object-cover object-center transform hover:scale-105 transition-transform duration-700 ease-out"
              />

              {/* Optional: Floating badge or overlay content */}
              <div className="absolute bottom-6 left-6 z-30">
                <div className="bg-[#151927]/90 backdrop-blur-sm border border-white/10 px-4 py-2 rounded-lg shadow-lg">
                  <p className="text-white font-medium text-sm">Márk Bartha</p>
                  <p className="text-[#20B7F3] text-xs font-mono">
                    Independent Consultant
                  </p>
                </div>
              </div>
            </div>
          </motion.div>
        </div>
      </div>
    </section>
  )
}

```
```components/Navigation.tsx
import React, { useEffect, useState } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { Menu, X } from 'lucide-react'
import { Link, useLocation, useNavigate } from 'react-router-dom'
import { Button } from './ui/Button'
const navItems = [
  {
    name: 'Home',
    href: '/',
  },
  {
    name: 'Services',
    href: '/#services',
  },
  {
    name: 'Case Studies',
    href: '/#work',
  },
  {
    name: 'About',
    href: '/about',
  },
  {
    name: 'Blog',
    href: '/blog',
  },
]
export function Navigation() {
  const [isScrolled, setIsScrolled] = useState(false)
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false)
  const location = useLocation()
  const navigate = useNavigate()
  useEffect(() => {
    const handleScroll = () => {
      setIsScrolled(window.scrollY > 20)
    }
    window.addEventListener('scroll', handleScroll)
    return () => window.removeEventListener('scroll', handleScroll)
  }, [])
  const isActive = (href: string) => {
    if (href === '/') return location.pathname === '/'
    return location.pathname.startsWith(href)
  }
  const handleContactClick = () => {
    navigate('/contact')
    setIsMobileMenuOpen(false)
  }
  return (
    <>
      <motion.nav
        initial={{
          y: -100,
        }}
        animate={{
          y: 0,
        }}
        className={`fixed top-0 left-0 right-0 z-50 transition-all duration-300 py-4 ${isScrolled ? 'bg-[#151927]/95 backdrop-blur-md shadow-lg' : 'bg-[#151927]/0'}`}
      >
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between">
            {/* Logo */}
            <Link
              to="/"
              className="text-2xl font-bold text-white font-figtree tracking-tight"
            >
              Márk Bartha
            </Link>

            {/* Desktop Navigation */}
            <div className="hidden md:flex items-center space-x-8">
              {navItems.map((item) =>
                item.href.includes('#') ? (
                  <a
                    key={item.name}
                    href={item.href}
                    className="text-sm font-medium text-[#dddfed]/80 hover:text-[#20B7F3] transition-colors"
                  >
                    {item.name}
                  </a>
                ) : (
                  <Link
                    key={item.name}
                    to={item.href}
                    className={`text-sm font-medium transition-colors ${isActive(item.href) ? 'text-[#20B7F3]' : 'text-[#dddfed]/80 hover:text-[#20B7F3]'}`}
                  >
                    {item.name}
                  </Link>
                ),
              )}
              <Button variant="primary" size="sm" onClick={handleContactClick}>
                Contact
              </Button>
            </div>

            {/* Mobile Menu Button */}
            <button
              className="md:hidden text-white p-2"
              onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
              aria-label="Toggle menu"
            >
              {isMobileMenuOpen ? <X size={24} /> : <Menu size={24} />}
            </button>
          </div>
        </div>
      </motion.nav>

      {/* Mobile Menu Overlay */}
      <AnimatePresence>
        {isMobileMenuOpen && (
          <motion.div
            initial={{
              opacity: 0,
              height: 0,
            }}
            animate={{
              opacity: 1,
              height: 'auto',
            }}
            exit={{
              opacity: 0,
              height: 0,
            }}
            className="fixed top-[70px] left-0 right-0 bg-[#151927] border-b border-white/10 z-40 md:hidden overflow-hidden"
          >
            <div className="px-4 py-6 space-y-4">
              {navItems.map((item) =>
                item.href.includes('#') ? (
                  <a
                    key={item.name}
                    href={item.href}
                    className="block text-lg font-medium text-[#dddfed] hover:text-[#20B7F3] py-2"
                    onClick={() => setIsMobileMenuOpen(false)}
                  >
                    {item.name}
                  </a>
                ) : (
                  <Link
                    key={item.name}
                    to={item.href}
                    className={`block text-lg font-medium py-2 ${isActive(item.href) ? 'text-[#20B7F3]' : 'text-[#dddfed] hover:text-[#20B7F3]'}`}
                    onClick={() => setIsMobileMenuOpen(false)}
                  >
                    {item.name}
                  </Link>
                ),
              )}
              <div className="pt-4">
                <Button
                  variant="primary"
                  className="w-full justify-center"
                  onClick={handleContactClick}
                >
                  Contact
                </Button>
              </div>
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </>
  )
}

```
```components/ProblemSection.tsx
import React from 'react'
import { motion } from 'framer-motion'
import { XCircle } from 'lucide-react'
const problems = [
  "Content lives everywhere, so customers and prospects can't find what matters",
  'Publishing is slow, and the team avoids touching the CMS',
  'Support answers the same questions repeatedly',
  "The website doesn't reflect your expertise",
]
export function ProblemSection() {
  return (
    <section className="py-20 bg-[#edeef7] text-[#151927]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
          <motion.div
            initial={{
              opacity: 0,
              x: -20,
            }}
            whileInView={{
              opacity: 1,
              x: 0,
            }}
            viewport={{
              once: true,
            }}
            transition={{
              duration: 0.6,
            }}
          >
            <h2 className="text-3xl md:text-4xl font-bold mb-6">
              The reality for most B2B teams
            </h2>
            <p className="text-lg text-[#151927]/70 mb-8">
              You have great expertise, but your digital presence is holding you
              back. The gap between what you know and what you show is costing
              you leads and time.
            </p>
          </motion.div>

          <div className="space-y-4">
            {problems.map((problem, index) => (
              <motion.div
                key={index}
                initial={{
                  opacity: 0,
                  y: 10,
                }}
                whileInView={{
                  opacity: 1,
                  y: 0,
                }}
                viewport={{
                  once: true,
                }}
                transition={{
                  delay: index * 0.1,
                  duration: 0.5,
                }}
                className="flex items-start p-4 bg-white rounded-lg shadow-sm border border-gray-100"
              >
                <XCircle className="w-6 h-6 text-red-500 mr-4 flex-shrink-0 mt-0.5" />
                <span className="text-lg font-medium">{problem}</span>
              </motion.div>
            ))}
          </div>
        </div>
      </div>
    </section>
  )
}

```
```components/ProcessSection.tsx
import React from 'react'
import { motion } from 'framer-motion'
import { Button } from './ui/Button'
import { useNavigate } from 'react-router-dom'
const steps = [
  {
    number: '01',
    title: 'Align on goals and content reality',
    description:
      'We clarify what the site needs to achieve (sales, support, hiring) and map the content types, workflows, and constraints.',
  },
  {
    number: '02',
    title: 'Design the content model and structure',
    description:
      'Content types, taxonomy, navigation, and reusable components. This is what makes the platform scalable and AI-ready later.',
  },
  {
    number: '03',
    title: 'Build and ship in increments',
    description:
      'A usable slice first, then expand. You get working pages early, not a big-bang launch at the end.',
  },
  {
    number: '04',
    title: 'Polish, train, and hand over',
    description:
      'Editor training, documentation, and optional support. If AI features are planned, we add guardrails and measure impact.',
  },
]
export function ProcessSection() {
  const navigate = useNavigate()
  return (
    <section className="py-24 bg-[#151927] text-[#dddfed]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <motion.div
          initial={{
            opacity: 0,
            y: 20,
          }}
          whileInView={{
            opacity: 1,
            y: 0,
          }}
          viewport={{
            once: true,
          }}
          className="text-center mb-16"
        >
          <h2 className="text-3xl md:text-4xl font-bold text-white mb-4 font-figtree">
            How it works
          </h2>
          <p className="text-[#dddfed]/70 max-w-2xl mx-auto text-lg">
            A straightforward process that keeps scope under control and makes
            progress visible.
          </p>
        </motion.div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 mb-12">
          {steps.map((step, index) => (
            <motion.div
              key={index}
              initial={{
                opacity: 0,
                y: 20,
              }}
              whileInView={{
                opacity: 1,
                y: 0,
              }}
              viewport={{
                once: true,
              }}
              transition={{
                delay: index * 0.1,
              }}
              className="relative"
            >
              <div className="text-6xl font-mono font-bold text-white/5 mb-4 absolute -top-8 -left-4 select-none">
                {step.number}
              </div>
              <div className="relative z-10">
                <h3 className="text-xl font-bold text-white mb-3 font-figtree">
                  {step.title}
                </h3>
                <p className="text-[#dddfed]/60 text-sm leading-relaxed">
                  {step.description}
                </p>
              </div>
            </motion.div>
          ))}
        </div>

        <motion.div
          initial={{
            opacity: 0,
            y: 20,
          }}
          whileInView={{
            opacity: 1,
            y: 0,
          }}
          viewport={{
            once: true,
          }}
          transition={{
            delay: 0.4,
          }}
          className="flex flex-col sm:flex-row gap-4 justify-center items-center"
        >
          <Button
            variant="primary"
            size="lg"
            onClick={() => navigate('/contact')}
          >
            Contact me
          </Button>
          <Button
            variant="ghost"
            size="lg"
            className="text-white hover:bg-white/10 hover:text-white"
            onClick={() => {
              // Scroll to case studies section or navigate to case studies page when available
              const element = document.getElementById('work')
              if (element) {
                element.scrollIntoView({
                  behavior: 'smooth',
                })
              }
            }}
          >
            See case studies
          </Button>
        </motion.div>
      </div>
    </section>
  )
}

```
```components/ProofSection.tsx
import React from 'react'
import { motion } from 'framer-motion'
const metrics = [
  {
    value: '3x',
    label: 'Faster publishing',
  },
  {
    value: '60%',
    label: 'Fewer support tickets',
  },
  {
    value: '2x',
    label: 'Organic traffic',
  },
  {
    value: '90%',
    label: 'Editor satisfaction',
  },
]
export function ProofSection() {
  return (
    <section className="py-24 bg-[#151927] text-[#dddfed]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <motion.div
          initial={{
            opacity: 0,
          }}
          whileInView={{
            opacity: 1,
          }}
          viewport={{
            once: true,
          }}
          className="text-center mb-16"
        >
          <h2 className="text-3xl md:text-4xl font-bold text-white mb-4">
            Results that matter
          </h2>
        </motion.div>

        <div className="grid grid-cols-2 md:grid-cols-4 gap-8 mb-20 border-b border-white/10 pb-12">
          {metrics.map((metric, index) => (
            <motion.div
              key={index}
              initial={{
                opacity: 0,
                scale: 0.9,
              }}
              whileInView={{
                opacity: 1,
                scale: 1,
              }}
              viewport={{
                once: true,
              }}
              transition={{
                delay: index * 0.1,
              }}
              className="text-center"
            >
              <div className="text-4xl md:text-5xl font-bold text-[#20B7F3] mb-2 font-mono">
                {metric.value}
              </div>
              <div className="text-sm md:text-base text-[#dddfed]/60">
                {metric.label}
              </div>
            </motion.div>
          ))}
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          <motion.div
            initial={{
              opacity: 0,
              x: -20,
            }}
            whileInView={{
              opacity: 1,
              x: 0,
            }}
            viewport={{
              once: true,
            }}
            className="bg-white/5 p-8 rounded-xl border border-white/10"
          >
            <p className="text-lg italic text-[#dddfed]/90 mb-6">
              "Márk transformed our scattered documentation into a cohesive
              knowledge hub. Our support team finally has a single source of
              truth, and customers love the self-service experience."
            </p>
            <div className="flex items-center">
              <div className="w-10 h-10 bg-[#20B7F3] rounded-full mr-4"></div>
              <div>
                <div className="font-bold text-white">Sarah Jenkins</div>
                <div className="text-sm text-[#dddfed]/60">
                  Head of Customer Success, TechFlow
                </div>
              </div>
            </div>
          </motion.div>

          <motion.div
            initial={{
              opacity: 0,
              x: 20,
            }}
            whileInView={{
              opacity: 1,
              x: 0,
            }}
            viewport={{
              once: true,
            }}
            transition={{
              delay: 0.2,
            }}
            className="bg-white/5 p-8 rounded-xl border border-white/10"
          >
            <p className="text-lg italic text-[#dddfed]/90 mb-6">
              "We were afraid of another long, painful redesign. Márk's process
              was transparent, phased, and actually enjoyable. The new site is
              blazing fast and easy to update."
            </p>
            <div className="flex items-center">
              <div className="w-10 h-10 bg-[#20B7F3] rounded-full mr-4"></div>
              <div>
                <div className="font-bold text-white">David Chen</div>
                <div className="text-sm text-[#dddfed]/60">CTO, Nexus Corp</div>
              </div>
            </div>
          </motion.div>
        </div>
      </div>
    </section>
  )
}

```
```components/ServicesSection.tsx
import React from 'react'
import { motion } from 'framer-motion'
import { Button } from './ui/Button'
import { Check } from 'lucide-react'
const services = [
  {
    title: 'Content-Heavy Website (Re)build',
    outcome:
      'Modern, maintainable site that communicates expertise and converts.',
    features: [
      'Content audit & strategy',
      'Information architecture',
      'Custom CMS setup',
    ],
    cta: 'Learn more',
  },
  {
    title: 'Knowledge Hub / Help Center',
    outcome: 'Searchable self-service content that reduces support load.',
    features: [
      'Content structure design',
      'Advanced search implementation',
      'Editorial workflow setup',
    ],
    cta: 'Learn more',
  },
  {
    title: 'Content Architecture & CMS Roadmap',
    outcome: 'Audit + structure + plan; reduces risk before a rebuild.',
    features: [
      'Deep content audit',
      'IA design & mapping',
      'Migration roadmap',
    ],
    cta: 'Learn more',
  },
]
export function ServicesSection() {
  return (
    <section className="py-24 bg-[#edeef7] text-[#151927]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <motion.div
          initial={{
            opacity: 0,
            y: 20,
          }}
          whileInView={{
            opacity: 1,
            y: 0,
          }}
          viewport={{
            once: true,
          }}
          className="mb-12"
        >
          <h2 className="text-3xl md:text-4xl font-bold mb-4">How I help</h2>
          <p className="text-lg text-[#151927]/70 max-w-2xl">
            Specialized services for B2B companies that need to manage complex
            content.
          </p>
        </motion.div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {services.map((service, index) => (
            <motion.div
              key={index}
              initial={{
                opacity: 0,
                y: 20,
              }}
              whileInView={{
                opacity: 1,
                y: 0,
              }}
              viewport={{
                once: true,
              }}
              transition={{
                delay: index * 0.1,
              }}
              whileHover={{
                y: -4,
              }}
              className="bg-white p-8 rounded-xl shadow-sm border border-gray-100 flex flex-col h-full"
            >
              <h3 className="text-2xl font-bold mb-4 min-h-[64px]">
                {service.title}
              </h3>
              <p className="text-[#151927]/80 mb-8 font-medium">
                {service.outcome}
              </p>

              <ul className="space-y-3 mb-8 flex-1">
                {service.features.map((feature, idx) => (
                  <li
                    key={idx}
                    className="flex items-start text-sm text-[#151927]/70"
                  >
                    <Check className="w-5 h-5 text-[#20B7F3] mr-3 flex-shrink-0" />
                    {feature}
                  </li>
                ))}
              </ul>

              <Button
                variant="outline"
                className="w-full justify-between group"
              >
                {service.cta}
                <span className="group-hover:translate-x-1 transition-transform">
                  →
                </span>
              </Button>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  )
}

```
```components/SolutionSection.tsx
import React from 'react'
import { motion } from 'framer-motion'
import { Layers, Layout, Search, PenTool } from 'lucide-react'
const features = [
  {
    icon: Layers,
    title: 'Structured Content',
    description:
      'Services, case studies, insights, and docs organized logically, not just dumped in pages.',
  },
  {
    icon: Layout,
    title: 'Modular Building Blocks',
    description:
      'Flexible page building components that maintain design consistency without code.',
  },
  {
    icon: Search,
    title: 'Intelligent Search',
    description:
      'Navigation patterns and search functionality that actually help users find answers.',
  },
  {
    icon: PenTool,
    title: 'Editorial Workflow',
    description:
      'A CMS setup designed for writers and editors, streamlining the publishing process.',
  },
]
export function SolutionSection() {
  return (
    <section className="py-24 bg-[#151927] text-[#dddfed]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-3xl mx-auto mb-16">
          <motion.h2
            initial={{
              opacity: 0,
              y: 20,
            }}
            whileInView={{
              opacity: 1,
              y: 0,
            }}
            viewport={{
              once: true,
            }}
            className="text-3xl md:text-5xl font-bold text-white mb-6"
          >
            A content platform built for growth
          </motion.h2>
          <motion.p
            initial={{
              opacity: 0,
              y: 20,
            }}
            whileInView={{
              opacity: 1,
              y: 0,
            }}
            viewport={{
              once: true,
            }}
            transition={{
              delay: 0.1,
            }}
            className="text-xl text-[#dddfed]/80"
          >
            Stop wrestling with rigid templates. I build systems that adapt to
            your content strategy, not the other way around.
          </motion.p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          {features.map((feature, index) => (
            <motion.div
              key={index}
              initial={{
                opacity: 0,
                y: 20,
              }}
              whileInView={{
                opacity: 1,
                y: 0,
              }}
              viewport={{
                once: true,
              }}
              transition={{
                delay: index * 0.1,
              }}
              className="bg-white/5 border border-white/10 p-6 rounded-xl hover:bg-white/10 transition-colors duration-300"
            >
              <div className="w-12 h-12 bg-[#20B7F3]/10 rounded-lg flex items-center justify-center mb-4">
                <feature.icon className="w-6 h-6 text-[#20B7F3]" />
              </div>
              <h3 className="text-xl font-bold text-white mb-3">
                {feature.title}
              </h3>
              <p className="text-[#dddfed]/70 leading-relaxed">
                {feature.description}
              </p>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  )
}

```
```components/ui/Button.tsx
import React from 'react'
import { motion } from 'framer-motion'
import { ArrowRight } from 'lucide-react'
interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary' | 'outline' | 'ghost'
  size?: 'sm' | 'md' | 'lg'
  withArrow?: boolean
}
export function Button({
  children,
  variant = 'primary',
  size = 'md',
  className = '',
  withArrow = false,
  ...props
}: ButtonProps) {
  const baseStyles =
    'inline-flex items-center justify-center font-medium transition-colors duration-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-offset-2 disabled:opacity-50 disabled:cursor-not-allowed'
  const variants = {
    primary:
      'bg-[#20B7F3] text-[#151927] hover:bg-[#1aa3d9] focus:ring-[#20B7F3]',
    secondary:
      'bg-[#151927] text-white hover:bg-[#1f253a] focus:ring-[#151927]',
    outline:
      'border-2 border-[#151927] text-[#151927] hover:bg-[#151927] hover:text-white focus:ring-[#151927]',
    ghost:
      'text-[#20B7F3] hover:bg-[#20B7F3]/10 focus:ring-[#20B7F3] border border-transparent hover:border-[#20B7F3]/30',
  }
  // Special handling for dark mode contexts (passed via className if needed, but defaults here are for light bg)
  // If used on dark bg, parent should override or we could add 'inverse' variants.
  // For now, we'll stick to these and handle specific overrides in usage.
  const sizes = {
    sm: 'px-4 py-2 text-sm',
    md: 'px-6 py-3 text-base',
    lg: 'px-8 py-4 text-lg',
  }
  return (
    <motion.button
      whileHover={{
        scale: 1.02,
      }}
      whileTap={{
        scale: 0.98,
      }}
      className={`${baseStyles} ${variants[variant]} ${sizes[size]} ${className}`}
      {...props}
    >
      {children}
      {withArrow && <ArrowRight className="ml-2 h-4 w-4" />}
    </motion.button>
  )
}

```
```components/WhatIBuildSection.tsx
import React from 'react'
import { motion } from 'framer-motion'
import { ArrowRight, CheckCircle2 } from 'lucide-react'
import { Link } from 'react-router-dom'
const offerings = [
  {
    title: 'Marketing websites + landing pages',
    description:
      "Clear messaging, fast pages, and a CMS your team won't fight.",
    features: [
      'Modular sections you can reuse',
      'SEO-friendly structure and performance',
      'Built for iteration, not one-off launches',
    ],
  },
  {
    title: 'Content platforms',
    description:
      'For teams publishing regularly and needing structure, workflow, and governance.',
    features: [
      'Structured content types and reusable blocks',
      'Editorial workflow that fits your team',
      'Taxonomy and content organization that scales',
    ],
  },
  {
    title: 'Knowledge hubs',
    description:
      'Help centers and resource libraries that reduce support load and make content easy to find.',
    features: [
      'Information architecture + navigation',
      'Search that actually works',
      'Optional AI search/chat grounded in your content',
    ],
  },
]
export function WhatIBuildSection() {
  return (
    <section className="py-24 bg-[#edeef7]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-3xl mx-auto mb-16">
          <motion.div
            initial={{
              opacity: 0,
              y: 20,
            }}
            whileInView={{
              opacity: 1,
              y: 0,
            }}
            viewport={{
              once: true,
            }}
            transition={{
              duration: 0.6,
            }}
          >
            <h2 className="text-3xl md:text-4xl font-bold text-[#151927] mb-4 font-figtree">
              What I build for B2B teams
            </h2>
            <p className="text-lg text-[#151927]/70 leading-relaxed">
              Practical, content-heavy websites and knowledge hubs that stay
              easy to manage as you grow. AI features are optional and only
              added when they improve the workflow.
            </p>
          </motion.div>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mb-12">
          {offerings.map((offering, index) => (
            <motion.div
              key={index}
              initial={{
                opacity: 0,
                y: 20,
              }}
              whileInView={{
                opacity: 1,
                y: 0,
              }}
              viewport={{
                once: true,
              }}
              transition={{
                delay: index * 0.1,
                duration: 0.5,
              }}
              className="bg-white rounded-xl p-8 shadow-sm border border-gray-100 flex flex-col"
            >
              <h3 className="text-xl font-bold text-[#151927] mb-3 font-figtree">
                {offering.title}
              </h3>
              <p className="text-[#151927]/70 mb-6 leading-relaxed">
                {offering.description}
              </p>

              <ul className="space-y-3 flex-1">
                {offering.features.map((feature, idx) => (
                  <li
                    key={idx}
                    className="flex items-start text-sm text-[#151927]/70"
                  >
                    <CheckCircle2 className="w-5 h-5 text-[#20B7F3] mr-3 flex-shrink-0 mt-0.5" />
                    <span>{feature}</span>
                  </li>
                ))}
              </ul>
            </motion.div>
          ))}
        </div>

        <motion.div
          initial={{
            opacity: 0,
          }}
          whileInView={{
            opacity: 1,
          }}
          viewport={{
            once: true,
          }}
          transition={{
            delay: 0.4,
          }}
          className="text-center"
        >
          <Link
            to="/contact"
            className="inline-flex items-center text-sm font-medium text-[#151927] hover:text-[#20B7F3] transition-colors group"
          >
            Want to talk about your site?
            <ArrowRight className="ml-2 w-4 h-4 group-hover:translate-x-1 transition-transform" />
          </Link>
        </motion.div>
      </div>
    </section>
  )
}

```
```components/WhyMarkSection.tsx
import React from 'react'
import { motion } from 'framer-motion'
import { CheckCircle2, Quote } from 'lucide-react'
const benefits = [
  {
    title: 'Direct access, faster decisions',
    description:
      'No account managers or hand-offs. You work directly with me, which means faster feedback loops and clearer communication.',
  },
  {
    title: 'Senior expertise without agency overhead',
    description:
      'You get enterprise-level experience at a fraction of agency costs. No junior developers learning on your project.',
  },
  {
    title: 'Long-term thinking, not just launch day',
    description:
      'I build platforms that your team can maintain and evolve. Training and documentation are included, not afterthoughts.',
  },
  {
    title: 'Focused capacity means better quality',
    description:
      'I limit concurrent projects to 2-3 at a time. Your project gets the attention it deserves, not divided focus.',
  },
]
const testimonials = [
  {
    quote:
      "Márk didn't just build us a website—he built us a system we can actually maintain. Our marketing team finally feels confident making updates without breaking things.",
    author: 'Sarah Chen',
    role: 'VP of Marketing',
    company: 'TechCorp',
  },
  {
    quote:
      "The knowledge hub Márk built reduced our support load significantly. More importantly, he trained our team so well that we've been able to expand it ourselves.",
    author: 'James Wilson',
    role: 'Head of Customer Success',
    company: 'CloudSolutions',
  },
]
export function WhyMarkSection() {
  return (
    <section className="py-24 bg-[#edeef7]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <motion.div
          initial={{
            opacity: 0,
            y: 20,
          }}
          whileInView={{
            opacity: 1,
            y: 0,
          }}
          viewport={{
            once: true,
          }}
          className="text-center mb-16"
        >
          <h2 className="text-3xl md:text-4xl font-bold text-[#151927] mb-4 font-figtree">
            Why work with an independent consultant?
          </h2>
          <p className="text-lg text-[#151927]/70 max-w-2xl mx-auto">
            You get senior expertise with direct collaboration—no agency
            overhead, no hand-offs.
          </p>
        </motion.div>

        {/* Benefits Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mb-16">
          {benefits.map((benefit, index) => (
            <motion.div
              key={index}
              initial={{
                opacity: 0,
                y: 20,
              }}
              whileInView={{
                opacity: 1,
                y: 0,
              }}
              viewport={{
                once: true,
              }}
              transition={{
                delay: index * 0.1,
              }}
              className="flex gap-4"
            >
              <div className="flex-shrink-0">
                <CheckCircle2 className="w-6 h-6 text-[#20B7F3]" />
              </div>
              <div>
                <h3 className="text-lg font-bold text-[#151927] mb-2 font-figtree">
                  {benefit.title}
                </h3>
                <p className="text-[#151927]/70 text-sm leading-relaxed">
                  {benefit.description}
                </p>
              </div>
            </motion.div>
          ))}
        </div>

        {/* Testimonials */}
        <motion.div
          initial={{
            opacity: 0,
            y: 20,
          }}
          whileInView={{
            opacity: 1,
            y: 0,
          }}
          viewport={{
            once: true,
          }}
          transition={{
            delay: 0.4,
          }}
        >
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {testimonials.map((testimonial, index) => (
              <div
                key={index}
                className="bg-white rounded-xl p-8 shadow-sm border border-gray-100"
              >
                <Quote className="w-8 h-8 text-[#20B7F3]/20 mb-4" />
                <p className="text-[#151927]/80 leading-relaxed mb-6 italic">
                  "{testimonial.quote}"
                </p>
                <div className="border-t border-gray-100 pt-4">
                  <p className="font-bold text-[#151927] font-figtree">
                    {testimonial.author}
                  </p>
                  <p className="text-sm text-[#151927]/60">
                    {testimonial.role}, {testimonial.company}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </motion.div>
      </div>
    </section>
  )
}

```
```index.css

@import url('https://fonts.googleapis.com/css2?family=DM+Mono:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500&family=DM+Sans:ital,opsz,wght@0,9..40,100..1000;1,9..40,100..1000&family=Figtree:ital,wght@0,300..900;1,300..900&display=swap');

@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  --color-dark-blue: #151927;
  --color-light-blue: #20B7F3;
  --color-light-bg: #edeef7;
  --color-light-text: #dddfed;
}

body {
  font-family: 'DM Sans', sans-serif;
  background-color: var(--color-light-bg);
  color: var(--color-dark-blue);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

h1, h2, h3, h4, h5, h6 {
  font-family: 'Figtree', sans-serif;
}

code, pre, .font-mono {
  font-family: 'DM Mono', monospace;
}

```
```index.tsx
import './index.css'
import React from "react";
import { render } from "react-dom";
import { App } from "./App";

render(<App />, document.getElementById("root"));

```
```pages/AboutPage.tsx
import React from 'react'
import { motion } from 'framer-motion'
import { Navigation } from '../components/Navigation'
import { Button } from '../components/ui/Button'
import {
  CheckCircle2,
  Github,
  MessageSquare,
  Code2,
  ArrowRight,
  Quote,
  Building2,
  Users,
  Briefcase,
} from 'lucide-react'
import { useNavigate } from 'react-router-dom'
const strengths = [
  'Content modeling and information architecture for complex sites',
  'CMS editing experience and governance that teams actually adopt',
  'Knowledge hubs and documentation systems that reduce support friction',
  'Long-term maintainability in .NET (clean architecture, safe iteration)',
  'Pragmatic AI in content platforms (integrated, grounded, optional)',
]
const orchardBenefits = [
  {
    title: 'Structured content and reusable blocks',
    description:
      'Perfect for landing pages, resource libraries, and multi-section sites',
  },
  {
    title: 'Editor-friendly workflows',
    description: 'Content changes are safe and governed, not scary',
  },
  {
    title: 'Extensibility for the long term',
    description:
      'Custom features, integrations, and platform improvements over time',
  },
  {
    title: 'Microsoft-friendly stack',
    description: 'Fits teams already invested in .NET and Azure',
  },
  {
    title: 'Open-source flexibility',
    description: 'Long-term ownership with no hard vendor lock-in',
  },
]
export function AboutPage() {
  const navigate = useNavigate()
  return (
    <main className="min-h-screen w-full overflow-x-hidden bg-[#151927]">
      <Navigation />

      {/* Hero with Photo */}
      <section className="pt-32 pb-24 bg-[#151927] text-[#dddfed] relative overflow-hidden">
        {/* Background decoration */}
        <div className="absolute top-0 right-0 w-1/2 h-full bg-gradient-to-l from-[#20B7F3]/5 to-transparent pointer-events-none" />

        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
            <motion.div
              initial={{
                opacity: 0,
                x: -20,
              }}
              animate={{
                opacity: 1,
                x: 0,
              }}
              transition={{
                duration: 0.6,
              }}
            >
              <span className="inline-block py-1 px-3 rounded-full bg-[#20B7F3]/10 text-[#20B7F3] font-mono text-sm mb-6 border border-[#20B7F3]/20">
                Independent B2B Software Partner
              </span>
              <h1 className="text-4xl md:text-5xl font-bold text-white mb-6 font-figtree leading-tight">
                Building platforms that teams can actually manage
              </h1>
              <p className="text-xl text-[#dddfed]/80 leading-relaxed mb-8">
                I'm Márk Bartha, an independent software partner specializing in
                content-heavy B2B websites and platforms. Since 2013, I've been
                helping teams move beyond "just a website" with systems built
                for the long term.
              </p>
              <div className="flex flex-wrap gap-4">
                <Button
                  variant="primary"
                  size="lg"
                  onClick={() => navigate('/contact')}
                >
                  Let's talk
                </Button>
                <Button
                  variant="ghost"
                  size="lg"
                  className="text-white hover:bg-white/10 hover:text-white border-white/20 hover:border-white/40"
                  onClick={() => {
                    const element = document.getElementById('story')
                    element?.scrollIntoView({
                      behavior: 'smooth',
                    })
                  }}
                >
                  Read my story
                </Button>
              </div>
            </motion.div>

            <motion.div
              initial={{
                opacity: 0,
                x: 20,
              }}
              animate={{
                opacity: 1,
                x: 0,
              }}
              transition={{
                delay: 0.2,
                duration: 0.8,
              }}
              className="relative"
            >
              <div className="absolute -top-4 -right-4 w-full h-full border-2 border-[#20B7F3]/20 rounded-2xl z-0 hidden md:block" />
              <div className="relative z-10 rounded-2xl overflow-hidden shadow-2xl border border-white/10 aspect-square max-w-md mx-auto lg:ml-auto">
                <img
                  src="https://markbartha.com/mediatheme/images/profile.jpg"
                  alt="Márk Bartha"
                  className="w-full h-full object-cover object-center"
                />
              </div>
            </motion.div>
          </div>
        </div>
      </section>

      {/* Experience Foundation - Split Layout */}
      <section id="story" className="py-24 bg-[#edeef7]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-16 items-start">
            {/* Left: Story */}
            <motion.div
              initial={{
                opacity: 0,
                x: -20,
              }}
              whileInView={{
                opacity: 1,
                x: 0,
              }}
              viewport={{
                once: true,
              }}
            >
              <div className="flex items-start gap-4 mb-6">
                <div className="w-14 h-14 rounded-xl bg-white border border-gray-200 flex items-center justify-center flex-shrink-0 p-2">
                  <img
                    src="https://lombiq.com/LombiqDotCom.Theme/icons/android-chrome-192x192.png"
                    alt="Lombiq Technologies"
                    className="w-full h-full object-contain"
                  />
                </div>
                <div>
                  <h2 className="text-3xl md:text-4xl font-bold text-[#151927] font-figtree leading-tight">
                    Shaped by a decade at Lombiq
                  </h2>
                  <p className="text-sm text-[#151927]/50 font-mono mt-2">
                    Independent partner since 2013
                  </p>
                </div>
              </div>

              <div className="space-y-6 text-[#151927]/70 leading-relaxed">
                <p>
                  My expertise comes from over a decade working as an
                  independent partner with Lombiq Technologies, delivering
                  Orchard Core and .NET platforms for enterprise clients across
                  finance, insurance, healthcare, and B2B services.
                </p>
                <p>
                  These weren't simple agency websites. I worked on complex
                  content platforms, knowledge hubs serving thousands of users,
                  editorial systems with sophisticated workflows, and customer
                  portals requiring deep integration and governance.
                </p>
                <p>
                  That experience taught me what separates platforms that scale
                  from ones that become maintenance nightmares: structured
                  content models, editor-friendly workflows, proper information
                  architecture, and systems designed for teams to run
                  independently.
                </p>
              </div>

              <div className="mt-8 pt-8 border-t border-gray-200">
                <p className="text-sm text-[#151927]/60 leading-relaxed">
                  <strong className="text-[#151927]">
                    Today I work independently.
                  </strong>{' '}
                  When projects need a larger team, I collaborate with yours and
                  can involve Lombiq as a delivery partner when it truly makes
                  sense.
                </p>
              </div>

              {/* Testimonial inline */}
              <div className="mt-8 bg-gradient-to-br from-[#20B7F3]/5 to-[#20B7F3]/10 rounded-xl p-6 border border-[#20B7F3]/20">
                <Quote className="w-8 h-8 text-[#20B7F3]/40 mb-3" />
                <p className="text-[#151927]/80 leading-relaxed italic mb-4">
                  "Márk has been an invaluable partner in delivering complex
                  content platforms. His technical expertise combined with
                  product thinking makes him uniquely effective at translating
                  business needs into maintainable solutions."
                </p>
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 rounded-full bg-white border border-gray-200 flex items-center justify-center p-1.5">
                    <img
                      src="https://lombiq.com/LombiqDotCom.Theme/icons/android-chrome-192x192.png"
                      alt="Lombiq"
                      className="w-full h-full object-contain"
                    />
                  </div>
                  <div>
                    <p className="font-bold text-[#151927] text-sm">
                      Zoltán Lehóczky
                    </p>
                    <p className="text-xs text-[#151927]/60">
                      CEO, Lombiq Technologies
                    </p>
                  </div>
                </div>
              </div>
            </motion.div>

            {/* Right: Project Scope & Roles */}
            <motion.div
              initial={{
                opacity: 0,
                x: 20,
              }}
              whileInView={{
                opacity: 1,
                x: 0,
              }}
              viewport={{
                once: true,
              }}
              transition={{
                delay: 0.2,
              }}
              className="space-y-8"
            >
              {/* Project Types */}
              <div className="bg-white rounded-xl p-8 shadow-sm border border-gray-100">
                <div className="flex items-center gap-3 mb-6">
                  <Building2 className="w-6 h-6 text-[#20B7F3]" />
                  <h3 className="text-xl font-bold text-[#151927] font-figtree">
                    Platform complexity
                  </h3>
                </div>
                <div className="space-y-3">
                  {[
                    {
                      label: 'Content platforms',
                      desc: 'Editorial systems with workflows and governance',
                    },
                    {
                      label: 'Knowledge hubs',
                      desc: 'Documentation sites serving thousands of users',
                    },
                    {
                      label: 'Customer portals',
                      desc: 'Authenticated experiences with deep integrations',
                    },
                    {
                      label: 'Marketing sites',
                      desc: 'High-traffic B2B websites with structured content',
                    },
                  ].map((item, i) => (
                    <div key={i} className="flex gap-3">
                      <div className="w-1.5 h-1.5 rounded-full bg-[#20B7F3] mt-2 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-[#151927]">
                          {item.label}
                        </p>
                        <p className="text-sm text-[#151927]/60">{item.desc}</p>
                      </div>
                    </div>
                  ))}
                </div>
              </div>

              {/* Industries */}
              <div className="bg-white rounded-xl p-8 shadow-sm border border-gray-100">
                <div className="flex items-center gap-3 mb-6">
                  <Users className="w-6 h-6 text-[#20B7F3]" />
                  <h3 className="text-xl font-bold text-[#151927] font-figtree">
                    Industries served
                  </h3>
                </div>
                <div className="flex flex-wrap gap-2">
                  {[
                    'Finance',
                    'Insurance',
                    'Healthcare',
                    'B2B Services',
                    'SaaS',
                    'Professional Services',
                  ].map((industry, i) => (
                    <span
                      key={i}
                      className="px-3 py-1.5 bg-[#edeef7] text-[#151927]/70 text-sm rounded-lg"
                    >
                      {industry}
                    </span>
                  ))}
                </div>
              </div>

              {/* Roles */}
              <div className="bg-white rounded-xl p-8 shadow-sm border border-gray-100">
                <div className="flex items-center gap-3 mb-6">
                  <Briefcase className="w-6 h-6 text-[#20B7F3]" />
                  <h3 className="text-xl font-bold text-[#151927] font-figtree">
                    Roles I've held
                  </h3>
                </div>
                <div className="space-y-4">
                  <div className="flex gap-4">
                    <div className="w-10 h-10 rounded-lg bg-[#20B7F3]/10 flex items-center justify-center flex-shrink-0">
                      <span className="text-[#20B7F3] font-bold text-sm">
                        TL
                      </span>
                    </div>
                    <div>
                      <p className="font-bold text-[#151927] mb-1">Tech Lead</p>
                      <p className="text-sm text-[#151927]/70">
                        Architecture decisions, technical tradeoffs, code
                        quality, and long-term maintainability
                      </p>
                    </div>
                  </div>
                  <div className="flex gap-4">
                    <div className="w-10 h-10 rounded-lg bg-[#20B7F3]/10 flex items-center justify-center flex-shrink-0">
                      <span className="text-[#20B7F3] font-bold text-sm">
                        PL
                      </span>
                    </div>
                    <div>
                      <p className="font-bold text-[#151927] mb-1">
                        Project Lead
                      </p>
                      <p className="text-sm text-[#151927]/70">
                        Delivery planning, scope management, stakeholder
                        coordination, keeping projects on track
                      </p>
                    </div>
                  </div>
                  <div className="flex gap-4">
                    <div className="w-10 h-10 rounded-lg bg-[#20B7F3]/10 flex items-center justify-center flex-shrink-0">
                      <span className="text-[#20B7F3] font-bold text-sm">
                        PP
                      </span>
                    </div>
                    <div>
                      <p className="font-bold text-[#151927] mb-1">
                        Product Partner
                      </p>
                      <p className="text-sm text-[#151927]/70">
                        Translating business goals into platform features,
                        content structure, and workflows that work
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </motion.div>
          </div>
        </div>
      </section>

      {/* What Makes Platforms Succeed */}
      <section className="py-24 bg-[#151927] text-[#dddfed]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div
            initial={{
              opacity: 0,
              y: 20,
            }}
            whileInView={{
              opacity: 1,
              y: 0,
            }}
            viewport={{
              once: true,
            }}
            className="text-center mb-16"
          >
            <h2 className="text-3xl md:text-4xl font-bold text-white mb-4 font-figtree">
              What makes platforms succeed after launch
            </h2>
            <p className="text-lg text-[#dddfed]/70 max-w-3xl mx-auto">
              Across dozens of projects, the biggest difference isn't the
              framework. It's structure, workflow, and maintainability.
            </p>
          </motion.div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6 max-w-5xl mx-auto">
            {[
              {
                title: 'Content modeling and reusable components',
                desc: 'Keep teams moving fast without breaking consistency. Structured content types and modular building blocks prevent chaos as sites grow.',
              },
              {
                title: 'Governance and workflows',
                desc: 'Prevent content drift and accidental breakage. Clear publishing rules and approval flows give teams confidence to make changes.',
              },
              {
                title: 'Search and information architecture',
                desc: 'Decide whether knowledge hubs actually work. Users need to find answers quickly, or the platform fails its purpose.',
              },
              {
                title: 'AI features done right',
                desc: 'Only valuable when integrated and controlled. Grounded Q&A, smart search, and metadata suggestions that teams can trust and govern.',
              },
            ].map((item, index) => (
              <motion.div
                key={index}
                initial={{
                  opacity: 0,
                  y: 20,
                }}
                whileInView={{
                  opacity: 1,
                  y: 0,
                }}
                viewport={{
                  once: true,
                }}
                transition={{
                  delay: index * 0.1,
                }}
                className="bg-white/5 rounded-xl p-6 border border-white/10"
              >
                <h3 className="text-lg font-bold text-white mb-3 font-figtree">
                  {item.title}
                </h3>
                <p className="text-[#dddfed]/70 leading-relaxed">{item.desc}</p>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* What I'm Known For - Bento Grid Style */}
      <section className="py-24 bg-[#edeef7]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div
            initial={{
              opacity: 0,
              y: 20,
            }}
            whileInView={{
              opacity: 1,
              y: 0,
            }}
            viewport={{
              once: true,
            }}
            className="text-center mb-16"
          >
            <h2 className="text-3xl md:text-4xl font-bold text-[#151927] mb-4 font-figtree">
              Specialist Strengths
            </h2>
            <p className="text-lg text-[#151927]/70 max-w-2xl mx-auto">
              Deep expertise in the areas that matter most for content-heavy B2B
              platforms
            </p>
          </motion.div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {strengths.map((strength, index) => (
              <motion.div
                key={index}
                initial={{
                  opacity: 0,
                  y: 20,
                }}
                whileInView={{
                  opacity: 1,
                  y: 0,
                }}
                viewport={{
                  once: true,
                }}
                transition={{
                  delay: index * 0.1,
                }}
                className="bg-white rounded-xl p-6 shadow-sm border border-gray-100"
              >
                <CheckCircle2 className="w-8 h-8 text-[#20B7F3] mb-4" />
                <p className="text-[#151927]/80 leading-relaxed">{strength}</p>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* Working With Me - Side by Side */}
      <section className="py-24 bg-[#151927] text-[#dddfed]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
            <motion.div
              initial={{
                opacity: 0,
                x: -20,
              }}
              whileInView={{
                opacity: 1,
                x: 0,
              }}
              viewport={{
                once: true,
              }}
            >
              <h2 className="text-3xl md:text-4xl font-bold text-white mb-6 font-figtree">
                Direct collaboration, senior ownership
              </h2>
              <div className="h-1 w-20 bg-[#20B7F3] mb-8" />
              <div className="space-y-6">
                <div className="flex gap-4">
                  <div className="w-2 h-2 rounded-full bg-[#20B7F3] mt-2 flex-shrink-0" />
                  <div>
                    <h3 className="font-bold text-white mb-2">
                      You work with the person doing the work
                    </h3>
                    <p className="text-[#dddfed]/70">
                      No account managers, no telephone game. Just direct
                      collaboration with the person building your solution.
                    </p>
                  </div>
                </div>
                <div className="flex gap-4">
                  <div className="w-2 h-2 rounded-full bg-[#20B7F3] mt-2 flex-shrink-0" />
                  <div>
                    <h3 className="font-bold text-white mb-2">
                      Fewer handoffs, faster iteration
                    </h3>
                    <p className="text-[#dddfed]/70">
                      Senior ownership throughout means decisions happen quickly
                      and implementation stays aligned with your goals.
                    </p>
                  </div>
                </div>
                <div className="flex gap-4">
                  <div className="w-2 h-2 rounded-full bg-[#20B7F3] mt-2 flex-shrink-0" />
                  <div>
                    <h3 className="font-bold text-white mb-2">
                      Comfortable with collaboration
                    </h3>
                    <p className="text-[#dddfed]/70">
                      I work well alongside your internal team, designer, or
                      agency—especially when you want a specialist to own the
                      platform side.
                    </p>
                  </div>
                </div>
              </div>
            </motion.div>

            <motion.div
              initial={{
                opacity: 0,
                x: 20,
              }}
              whileInView={{
                opacity: 1,
                x: 0,
              }}
              viewport={{
                once: true,
              }}
              transition={{
                delay: 0.2,
              }}
              className="bg-white/5 rounded-2xl p-8 lg:p-12 border border-white/10"
            >
              <div className="space-y-8">
                <div>
                  <div className="text-5xl font-bold text-[#20B7F3] mb-2 font-figtree">
                    10+
                  </div>
                  <p className="text-[#dddfed]/70">
                    Years of specialized experience
                  </p>
                </div>
                <div>
                  <div className="text-5xl font-bold text-[#20B7F3] mb-2 font-figtree">
                    2-3
                  </div>
                  <p className="text-[#dddfed]/70">
                    Active projects at a time (focused capacity)
                  </p>
                </div>
                <div>
                  <div className="text-5xl font-bold text-[#20B7F3] mb-2 font-figtree">
                    100%
                  </div>
                  <p className="text-[#dddfed]/70">
                    Direct collaboration with me
                  </p>
                </div>
              </div>
            </motion.div>
          </div>
        </div>
      </section>

      {/* Community - Cards */}
      <section className="py-24 bg-[#edeef7]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div
            initial={{
              opacity: 0,
              y: 20,
            }}
            whileInView={{
              opacity: 1,
              y: 0,
            }}
            viewport={{
              once: true,
            }}
            className="text-center mb-16"
          >
            <h2 className="text-3xl md:text-4xl font-bold text-[#151927] mb-4 font-figtree">
              Active in the Orchard Core Community
            </h2>
            <p className="text-lg text-[#151927]/70 max-w-2xl mx-auto">
              Contributing to the ecosystem through open-source work and
              knowledge sharing keeps me close to what's working in real
              projects today.
            </p>
          </motion.div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {[
              {
                icon: Github,
                title: 'Open Source',
                desc: 'Modules, fixes, and improvements to the Orchard Core platform',
              },
              {
                icon: MessageSquare,
                title: 'Community Support',
                desc: 'Helping others solve problems and sharing knowledge',
              },
              {
                icon: Code2,
                title: 'Best Practices',
                desc: 'Advocating for maintainable, long-term solutions',
              },
            ].map((item, index) => (
              <motion.div
                key={index}
                initial={{
                  opacity: 0,
                  y: 20,
                }}
                whileInView={{
                  opacity: 1,
                  y: 0,
                }}
                viewport={{
                  once: true,
                }}
                transition={{
                  delay: index * 0.1,
                }}
                className="bg-white rounded-xl p-8 shadow-sm border border-gray-100 text-center"
              >
                <item.icon className="w-12 h-12 text-[#20B7F3] mx-auto mb-4" />
                <h3 className="font-bold text-[#151927] mb-3 text-xl font-figtree">
                  {item.title}
                </h3>
                <p className="text-[#151927]/70 leading-relaxed">{item.desc}</p>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* Orchard Core - Feature Showcase */}
      <section className="py-24 bg-[#151927] text-[#dddfed]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div
            initial={{
              opacity: 0,
              y: 20,
            }}
            whileInView={{
              opacity: 1,
              y: 0,
            }}
            viewport={{
              once: true,
            }}
            className="text-center mb-16"
          >
            <h2 className="text-3xl md:text-4xl font-bold text-white mb-4 font-figtree">
              Why Orchard Core for B2B Teams
            </h2>
            <p className="text-lg text-[#dddfed]/70 max-w-3xl mx-auto leading-relaxed">
              A modern, modular .NET content platform designed for structured
              content and real-world workflows—not just page editing.
            </p>
          </motion.div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-12">
            {orchardBenefits.map((benefit, index) => (
              <motion.div
                key={index}
                initial={{
                  opacity: 0,
                  y: 20,
                }}
                whileInView={{
                  opacity: 1,
                  y: 0,
                }}
                viewport={{
                  once: true,
                }}
                transition={{
                  delay: index * 0.1,
                }}
                className="bg-white/5 rounded-xl p-6 border border-white/10"
              >
                <div className="flex items-start gap-4">
                  <div className="w-8 h-8 rounded-lg bg-[#20B7F3]/20 flex items-center justify-center flex-shrink-0 mt-1">
                    <CheckCircle2 className="w-5 h-5 text-[#20B7F3]" />
                  </div>
                  <div>
                    <h3 className="text-lg font-bold text-white mb-2 font-figtree">
                      {benefit.title}
                    </h3>
                    <p className="text-[#dddfed]/70 text-sm leading-relaxed">
                      {benefit.description}
                    </p>
                  </div>
                </div>
              </motion.div>
            ))}
          </div>

          <motion.div
            initial={{
              opacity: 0,
              y: 20,
            }}
            whileInView={{
              opacity: 1,
              y: 0,
            }}
            viewport={{
              once: true,
            }}
            className="bg-white/5 rounded-2xl p-8 lg:p-12 border border-white/10"
          >
            <h3 className="text-2xl font-bold text-white mb-4 font-figtree">
              AI Features, When They Make Sense
            </h3>
            <p className="text-[#dddfed]/80 leading-relaxed mb-8 text-lg">
              Orchard Core's modular architecture makes it a solid foundation
              for AI-assisted content workflows—better search, grounded Q&A,
              metadata suggestions. The key is doing it in a way that's
              integrated and governed, so teams can trust it.
            </p>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
              <div className="bg-white/5 rounded-xl p-6 border border-white/10">
                <h4 className="font-bold text-white mb-3 flex items-center gap-2">
                  <CheckCircle2 className="w-5 h-5 text-green-500" />
                  When I recommend it
                </h4>
                <p className="text-sm text-[#dddfed]/70">
                  Content-heavy sites, evolving requirements, long-term
                  maintainability needs, teams that value ownership
                </p>
              </div>
              <div className="bg-white/5 rounded-xl p-6 border border-white/10">
                <h4 className="font-bold text-white mb-3 flex items-center gap-2">
                  <span className="w-5 h-5 rounded-full border-2 border-white/20" />
                  When I don't
                </h4>
                <p className="text-sm text-[#dddfed]/70">
                  Simple brochure sites with minimal content ops, or teams
                  wanting an all-in-one SaaS marketing suite
                </p>
              </div>
            </div>
          </motion.div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-24 bg-[#edeef7]">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <motion.div
            initial={{
              opacity: 0,
              y: 20,
            }}
            whileInView={{
              opacity: 1,
              y: 0,
            }}
            viewport={{
              once: true,
            }}
          >
            <h2 className="text-3xl md:text-4xl font-bold text-[#151927] mb-6 font-figtree">
              Let's Talk About Your Project
            </h2>
            <p className="text-xl text-[#151927]/70 leading-relaxed mb-8 max-w-2xl mx-auto">
              If you're building a content-heavy B2B site or knowledge hub, I'd
              love to hear what you're working on.
            </p>
            <Button
              variant="primary"
              size="lg"
              onClick={() => navigate('/contact')}
              withArrow
            >
              Get in touch
            </Button>
          </motion.div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-[#151927] text-[#dddfed]/40 py-8 text-center text-sm border-t border-white/10">
        <div className="max-w-7xl mx-auto px-4">
          <p>
            &copy; {new Date().getFullYear()} Márk Bartha. All rights reserved.
          </p>
        </div>
      </footer>
    </main>
  )
}

```
```pages/BlogPage.tsx
import React from 'react'
import { Navigation } from '../components/Navigation'
import { BlogHero } from '../components/BlogHero'
import { BlogGrid } from '../components/BlogGrid'
import { CTASection } from '../components/CTASection'
export function BlogPage() {
  return (
    <main className="min-h-screen w-full overflow-x-hidden bg-[#edeef7]">
      <Navigation />
      <BlogHero />
      <BlogGrid />
      <CTASection />

      {/* Simple Footer Placeholder (Reused from HomePage pattern) */}
      <footer className="bg-[#151927] text-[#dddfed]/40 py-8 text-center text-sm border-t border-white/10">
        <div className="max-w-7xl mx-auto px-4">
          <p>
            &copy; {new Date().getFullYear()} Márk Bartha. All rights reserved.
          </p>
        </div>
      </footer>
    </main>
  )
}

```
```pages/BlogPostPage.tsx
import React, { useEffect } from 'react'
import { motion } from 'framer-motion'
import {
  Clock,
  Calendar,
  User,
  ArrowLeft,
  Share2,
  Linkedin,
  Twitter,
} from 'lucide-react'
import { Link, useParams } from 'react-router-dom'
import { Navigation } from '../components/Navigation'
import { CTASection } from '../components/CTASection'
import { Button } from '../components/ui/Button'
export function BlogPostPage() {
  const { slug } = useParams()
  // Scroll to top on mount
  useEffect(() => {
    window.scrollTo(0, 0)
  }, [slug])
  return (
    <main className="min-h-screen w-full bg-white">
      <Navigation />

      {/* Article Header */}
      <header className="pt-32 pb-12 bg-[#151927] text-[#dddfed]">
        <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div
            initial={{
              opacity: 0,
              y: 20,
            }}
            animate={{
              opacity: 1,
              y: 0,
            }}
            transition={{
              duration: 0.6,
            }}
          >
            <Link
              to="/blog"
              className="inline-flex items-center text-[#20B7F3] hover:text-white transition-colors mb-8 text-sm font-medium"
            >
              <ArrowLeft className="w-4 h-4 mr-2" />
              Back to Blog
            </Link>

            <div className="mb-6">
              <span className="inline-block py-1 px-3 rounded-full bg-[#20B7F3]/10 text-[#20B7F3] font-mono text-xs font-bold uppercase tracking-wider border border-[#20B7F3]/20">
                Content Strategy
              </span>
            </div>

            <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold text-white mb-6 font-figtree leading-tight">
              How to structure case studies for trust and leads
            </h1>

            <div className="flex flex-wrap items-center gap-6 text-sm text-[#dddfed]/60 font-mono">
              <div className="flex items-center">
                <User className="w-4 h-4 mr-2" />
                Márk Bartha
              </div>
              <div className="flex items-center">
                <Calendar className="w-4 h-4 mr-2" />
                Dec 10, 2024
              </div>
              <div className="flex items-center">
                <Clock className="w-4 h-4 mr-2" />6 min read
              </div>
            </div>
          </motion.div>
        </div>
      </header>

      {/* Article Content */}
      <article className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
        <motion.div
          initial={{
            opacity: 0,
          }}
          animate={{
            opacity: 1,
          }}
          transition={{
            delay: 0.2,
            duration: 0.6,
          }}
          className="font-dm-sans text-[#151927]"
        >
          {/* Introduction */}
          <p className="text-xl leading-relaxed text-gray-600 mb-12 font-medium">
            Case studies are powerful, but only if structured correctly. Most
            B2B companies treat them as simple success stories, missing the
            opportunity to convert prospects into qualified leads. Here is the
            framework that changes that.
          </p>

          {/* H2 Heading */}
          <h2 className="text-3xl font-bold font-figtree text-[#151927] mt-12 mb-6">
            Why case studies matter
          </h2>

          <p className="text-lg leading-relaxed text-gray-700 mb-6">
            In the B2B world, trust is the currency of conversion. Your
            prospects aren't just buying a product; they are buying a
            partnership and a promise of results. A well-structured case study
            acts as <span className="font-bold">social proof</span> on steroids.
          </p>

          <p className="text-lg leading-relaxed text-gray-700 mb-6">
            According to recent surveys, over 70% of B2B buyers cite case
            studies as the most influential content format during their
            decision-making process. Yet, many are dry, technical documents that
            fail to tell a compelling story.
          </p>

          {/* Blockquote */}
          <blockquote className="border-l-4 border-[#20B7F3] pl-6 my-10 italic text-xl text-gray-800 bg-gray-50 py-4 pr-4 rounded-r-lg">
            "A great case study doesn't just say 'we are great'. It says 'we
            understand your problem and here is exactly how we solve it'."
          </blockquote>

          {/* H2 Heading */}
          <h2 className="text-3xl font-bold font-figtree text-[#151927] mt-12 mb-6">
            The anatomy of a great case study
          </h2>

          <p className="text-lg leading-relaxed text-gray-700 mb-6">
            To move beyond generic praise, your case studies need a structured
            narrative arc. We recommend the "Challenge-Approach-Results"
            framework, but with a twist.
          </p>

          {/* H3 Heading */}
          <h3 className="text-2xl font-bold font-figtree text-[#151927] mt-8 mb-4">
            1. The Challenge
          </h3>

          <p className="text-lg leading-relaxed text-gray-700 mb-4">
            Don't just list the problem. Dive deep into the pain. What was at
            stake?
          </p>

          <ul className="list-disc list-outside ml-6 mb-8 space-y-2 text-lg text-gray-700 marker:text-[#20B7F3]">
            <li>
              <strong>Operational inefficiencies:</strong> How much time was
              being wasted?
            </li>
            <li>
              <strong>Lost revenue:</strong> What was the financial impact of
              the problem?
            </li>
            <li>
              <strong>Team morale:</strong> How was the issue affecting the
              people involved?
            </li>
          </ul>

          {/* H3 Heading */}
          <h3 className="text-2xl font-bold font-figtree text-[#151927] mt-8 mb-4">
            2. The Approach
          </h3>

          <p className="text-lg leading-relaxed text-gray-700 mb-4">
            This is where you show your expertise. Be specific about the
            solution.
          </p>

          <ol className="list-decimal list-outside ml-6 mb-8 space-y-2 text-lg text-gray-700 marker:text-[#151927] marker:font-bold">
            <li>
              We conducted a thorough audit of the existing infrastructure.
            </li>
            <li>
              We identified three key bottlenecks in the deployment pipeline.
            </li>
            <li>
              We implemented a custom CI/CD solution using industry-standard
              tools.
            </li>
          </ol>

          {/* Image with Caption */}
          <figure className="my-10">
            <div className="bg-gray-100 rounded-xl overflow-hidden shadow-md aspect-video flex items-center justify-center relative">
              <div className="absolute inset-0 bg-gradient-to-br from-[#151927]/5 to-[#151927]/10" />
              <span className="text-gray-400 font-mono">
                Dashboard Screenshot Placeholder
              </span>
            </div>
            <figcaption className="text-center text-sm text-gray-500 italic mt-3">
              Figure 1: The analytics dashboard showing pre-optimization metrics
              vs. post-optimization results.
            </figcaption>
          </figure>

          {/* H2 Heading */}
          <h2 className="text-3xl font-bold font-figtree text-[#151927] mt-12 mb-6">
            Implementation tips
          </h2>

          <p className="text-lg leading-relaxed text-gray-700 mb-6">
            When building your case study page, you might want to include
            dynamic data. Here is a simple example of how you might structure
            the data object in your code using{' '}
            <code className="bg-gray-100 px-2 py-1 rounded font-mono text-sm text-[#151927]">
              TypeScript
            </code>
            .
          </p>

          {/* Code Block */}
          <div className="bg-[#151927] text-[#dddfed] p-6 rounded-lg font-mono text-sm overflow-x-auto mb-8 shadow-lg">
            <pre>
              {`interface CaseStudy {
  id: string;
  client: string;
  industry: string;
  metrics: {
    label: string;
    value: string;
    growth: number;
  }[];
  tags: string[];
}`}
            </pre>
          </div>

          <p className="text-lg leading-relaxed text-gray-700 mb-6">
            This structure allows you to programmatically generate the "Results"
            section of your case study cards, ensuring consistency across your
            site. You can learn more about structured content in our{' '}
            <a
              href="#"
              className="text-[#20B7F3] underline hover:text-[#1aa3d9] transition-colors"
            >
              guide to content modeling
            </a>
            .
          </p>

          {/* H4 Heading */}
          <h4 className="text-xl font-bold font-figtree text-[#151927] mt-8 mb-4">
            Common mistakes to avoid
          </h4>

          <p className="text-lg leading-relaxed text-gray-700 mb-6">
            Avoid using jargon that your audience might not understand. Keep it
            simple, direct, and focused on the <em>business outcomes</em> rather
            than just the technical implementation details.
          </p>

          <hr className="border-gray-200 my-12" />

          {/* Conclusion */}
          <p className="text-lg leading-relaxed text-gray-700 mb-8">
            Ready to transform your case studies? Start by auditing your
            existing success stories and applying this framework. The results
            will speak for themselves.
          </p>
        </motion.div>

        {/* Article Footer / Author Bio */}
        <div className="mt-16 pt-8 border-t border-gray-100">
          <div className="flex items-start gap-6">
            <div className="w-16 h-16 rounded-full overflow-hidden flex-shrink-0 bg-gray-200">
              <img
                src="https://markbartha.com/mediatheme/images/profile.jpg"
                alt="Márk Bartha"
                className="w-full h-full object-cover"
              />
            </div>
            <div>
              <h3 className="text-lg font-bold font-figtree text-[#151927] mb-2">
                About the Author
              </h3>
              <p className="text-gray-600 text-sm leading-relaxed mb-4">
                Márk Bartha is an independent software partner helping B2B teams
                build scalable content platforms. He specializes in bridging the
                gap between technical complexity and editorial needs.
              </p>
              <div className="flex gap-4">
                <Button
                  variant="ghost"
                  size="sm"
                  className="pl-0 hover:bg-transparent hover:text-[#151927]"
                >
                  <Linkedin className="w-4 h-4 mr-2" />
                  LinkedIn
                </Button>
                <Button
                  variant="ghost"
                  size="sm"
                  className="pl-0 hover:bg-transparent hover:text-[#151927]"
                >
                  <Twitter className="w-4 h-4 mr-2" />
                  Twitter
                </Button>
              </div>
            </div>
          </div>
        </div>
      </article>

      <CTASection />

      <footer className="bg-[#151927] text-[#dddfed]/40 py-8 text-center text-sm border-t border-white/10">
        <div className="max-w-7xl mx-auto px-4">
          <p>
            &copy; {new Date().getFullYear()} Márk Bartha. All rights reserved.
          </p>
        </div>
      </footer>
    </main>
  )
}

```
```pages/ConfirmationPage.tsx
import React from 'react'
import { motion } from 'framer-motion'
import { Navigation } from '../components/Navigation'
import { Button } from '../components/ui/Button'
import { CheckCircle2, ArrowLeft, Home } from 'lucide-react'
import { useNavigate, useSearchParams } from 'react-router-dom'
export function ConfirmationPage() {
  const navigate = useNavigate()
  const [searchParams] = useSearchParams()
  // Get confirmation type from URL params, default to 'message'
  const type = searchParams.get('type') || 'message'
  // Configuration for different confirmation types
  const configs = {
    message: {
      icon: CheckCircle2,
      title: 'Message sent successfully',
      description:
        "Thanks for reaching out. I'll get back to you within 24 hours.",
      primaryAction: {
        label: 'Back to home',
        path: '/',
      },
      secondaryAction: {
        label: 'Read about me',
        path: '/about',
      },
    },
    // Add more types as needed
    subscribe: {
      icon: CheckCircle2,
      title: "You're subscribed",
      description:
        "Thanks for subscribing. You'll receive updates about new content and projects.",
      primaryAction: {
        label: 'Back to home',
        path: '/',
      },
      secondaryAction: {
        label: 'Read the blog',
        path: '/blog',
      },
    },
  }
  const config = configs[type as keyof typeof configs] || configs.message
  const Icon = config.icon
  return (
    <main className="min-h-screen w-full overflow-x-hidden bg-[#151927]">
      <Navigation />

      <section className="pt-32 pb-24 min-h-screen flex items-center justify-center">
        <div className="max-w-2xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <motion.div
            initial={{
              opacity: 0,
              scale: 0.9,
            }}
            animate={{
              opacity: 1,
              scale: 1,
            }}
            transition={{
              duration: 0.5,
            }}
          >
            {/* Success Icon */}
            <motion.div
              initial={{
                scale: 0,
              }}
              animate={{
                scale: 1,
              }}
              transition={{
                delay: 0.2,
                type: 'spring',
                stiffness: 200,
              }}
              className="inline-flex items-center justify-center w-20 h-20 rounded-full bg-green-500/10 border-2 border-green-500/20 mb-8"
            >
              <Icon className="w-10 h-10 text-green-500" />
            </motion.div>

            {/* Title */}
            <motion.h1
              initial={{
                opacity: 0,
                y: 20,
              }}
              animate={{
                opacity: 1,
                y: 0,
              }}
              transition={{
                delay: 0.3,
              }}
              className="text-3xl md:text-4xl font-bold text-white mb-4 font-figtree"
            >
              {config.title}
            </motion.h1>

            {/* Description */}
            <motion.p
              initial={{
                opacity: 0,
                y: 20,
              }}
              animate={{
                opacity: 1,
                y: 0,
              }}
              transition={{
                delay: 0.4,
              }}
              className="text-lg text-[#dddfed]/70 mb-8 leading-relaxed"
            >
              {config.description}
            </motion.p>

            {/* Actions */}
            <motion.div
              initial={{
                opacity: 0,
                y: 20,
              }}
              animate={{
                opacity: 1,
                y: 0,
              }}
              transition={{
                delay: 0.5,
              }}
              className="flex flex-col sm:flex-row gap-4 justify-center"
            >
              <Button
                variant="primary"
                size="lg"
                onClick={() => navigate(config.primaryAction.path)}
              >
                {config.primaryAction.label}
              </Button>
              <Button
                variant="ghost"
                size="lg"
                className="text-white hover:bg-white/10 hover:text-white border-white/20 hover:border-white/40"
                onClick={() => navigate(config.secondaryAction.path)}
              >
                {config.secondaryAction.label}
              </Button>
            </motion.div>

            {/* Decorative element */}
            <motion.div
              initial={{
                opacity: 0,
              }}
              animate={{
                opacity: 1,
              }}
              transition={{
                delay: 0.6,
              }}
              className="mt-12 pt-8 border-t border-white/10"
            >
              <p className="text-sm text-[#dddfed]/50">
                You can close this page or navigate using the buttons above
              </p>
            </motion.div>
          </motion.div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-[#151927] text-[#dddfed]/40 py-8 text-center text-sm border-t border-white/10">
        <div className="max-w-7xl mx-auto px-4">
          <p>
            &copy; {new Date().getFullYear()} Márk Bartha. All rights reserved.
          </p>
        </div>
      </footer>
    </main>
  )
}

```
```pages/ContactPage.tsx
import React from 'react'
import { motion } from 'framer-motion'
import { Mail, Linkedin, Calendar, ArrowRight } from 'lucide-react'
import { Navigation } from '../components/Navigation'
import { ContactForm } from '../components/ContactForm'
export function ContactPage() {
  return (
    <main className="min-h-screen w-full bg-[#edeef7]">
      <Navigation />

      {/* Header Section */}
      <section className="bg-[#151927] pt-32 pb-32 text-center px-4 relative overflow-hidden">
        {/* Background decoration */}
        <div className="absolute top-0 right-0 w-1/3 h-full bg-gradient-to-l from-[#20B7F3]/5 to-transparent pointer-events-none" />
        <div className="absolute bottom-0 left-0 w-1/4 h-1/2 bg-gradient-to-t from-[#20B7F3]/5 to-transparent pointer-events-none" />

        <div className="max-w-4xl mx-auto relative z-10">
          <motion.div
            initial={{
              opacity: 0,
              y: 20,
            }}
            animate={{
              opacity: 1,
              y: 0,
            }}
            transition={{
              duration: 0.6,
            }}
          >
            <span className="inline-block py-1 px-3 rounded-full bg-[#20B7F3]/10 text-[#20B7F3] font-mono text-sm mb-6 border border-[#20B7F3]/20">
              Get in touch
            </span>
            <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold text-white mb-6 font-figtree leading-tight">
              Let's talk about your{' '}
              <span className="text-[#20B7F3]">content platform</span>
            </h1>
            <p className="text-lg md:text-xl text-[#dddfed]/80 max-w-2xl mx-auto leading-relaxed">
              Book a strategy call or send me a message. I reply within 1
              business day.
            </p>
          </motion.div>
        </div>
      </section>

      {/* Form Section */}
      <section className="px-4 pb-24 -mt-20 relative z-20">
        <div className="max-w-2xl mx-auto">
          <ContactForm />

          {/* Alternative Contact Options */}
          <motion.div
            initial={{
              opacity: 0,
            }}
            whileInView={{
              opacity: 1,
            }}
            viewport={{
              once: true,
            }}
            transition={{
              delay: 0.3,
            }}
            className="mt-16 text-center"
          >
            <h2 className="text-xl font-bold text-[#151927] mb-8 font-figtree">
              Prefer a different approach?
            </h2>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              <a
                href="mailto:hello@markbartha.com"
                className="flex flex-col items-center p-6 bg-white rounded-xl shadow-sm border border-gray-100 hover:shadow-md hover:-translate-y-1 transition-all group"
              >
                <div className="w-12 h-12 bg-[#20B7F3]/10 rounded-full flex items-center justify-center mb-4 group-hover:bg-[#20B7F3]/20 transition-colors">
                  <Mail className="w-6 h-6 text-[#20B7F3]" />
                </div>
                <span className="font-medium text-[#151927]">Email Me</span>
                <span className="text-sm text-gray-500 mt-1">
                  hello@markbartha.com
                </span>
              </a>

              <a
                href="#"
                className="flex flex-col items-center p-6 bg-white rounded-xl shadow-sm border border-gray-100 hover:shadow-md hover:-translate-y-1 transition-all group"
              >
                <div className="w-12 h-12 bg-[#0077b5]/10 rounded-full flex items-center justify-center mb-4 group-hover:bg-[#0077b5]/20 transition-colors">
                  <Linkedin className="w-6 h-6 text-[#0077b5]" />
                </div>
                <span className="font-medium text-[#151927]">LinkedIn</span>
                <span className="text-sm text-gray-500 mt-1">
                  Connect with me
                </span>
              </a>

              <a
                href="#"
                className="flex flex-col items-center p-6 bg-white rounded-xl shadow-sm border border-gray-100 hover:shadow-md hover:-translate-y-1 transition-all group"
              >
                <div className="w-12 h-12 bg-purple-100 rounded-full flex items-center justify-center mb-4 group-hover:bg-purple-200 transition-colors">
                  <Calendar className="w-6 h-6 text-purple-600" />
                </div>
                <span className="font-medium text-[#151927]">Book a Call</span>
                <span className="text-sm text-gray-500 mt-1">
                  15-min intro chat
                </span>
              </a>
            </div>

            <p className="mt-12 text-gray-500 text-sm">
              No obligation. I'll share a clear next-step recommendation based
              on your needs.
            </p>
          </motion.div>
        </div>
      </section>

      <footer className="bg-[#151927] text-[#dddfed]/40 py-8 text-center text-sm border-t border-white/10">
        <div className="max-w-7xl mx-auto px-4">
          <p>
            &copy; {new Date().getFullYear()} Márk Bartha. All rights reserved.
          </p>
        </div>
      </footer>
    </main>
  )
}

```
```pages/HomePage.tsx
import React from 'react'
import { Navigation } from '../components/Navigation'
import { Hero } from '../components/Hero'
import { WhatIBuildSection } from '../components/WhatIBuildSection'
import { ProcessSection } from '../components/ProcessSection'
import { WhyMarkSection } from '../components/WhyMarkSection'
import { CTAWithFAQSection } from '../components/CTAWithFAQSection'
export function HomePage() {
  return (
    <main className="min-h-screen w-full overflow-x-hidden bg-[#151927]">
      <Navigation />
      <Hero />
      <WhatIBuildSection />
      <ProcessSection />
      <WhyMarkSection />
      <CTAWithFAQSection />

      {/* Simple Footer Placeholder */}
      <footer className="bg-[#151927] text-[#dddfed]/40 py-8 text-center text-sm border-t border-white/10">
        <div className="max-w-7xl mx-auto px-4">
          <p>
            &copy; {new Date().getFullYear()} Márk Bartha. All rights reserved.
          </p>
        </div>
      </footer>
    </main>
  )
}

```
```tailwind.config.js
export default {}
```
