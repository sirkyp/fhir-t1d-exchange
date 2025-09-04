# Building a FHIR Implementation Guide with AI: My T1D Exchange Journey

## Before we start ...

This document describes an interesting 'side project' I took on recently where I wanted to do two things:
- Deepen my understanding of how an AI agent could help me in my day-to-day work.
- Develop a FHIR Implementation Guide in an area with a non-standards based health care data specification.

I am writing this section myself, but the rest of this document and nearly all the content for the IG was created by me chatting with [Amazon Q Developer](https://aws.amazon.com/q/developer/) using Claude Sonnet 4 LLM via a VSCode plugin. This was me working on this off and on for a few weeks - I would estimate maybe 20-24 hours of my time. 

With that caveat, off we go ...

## How It All Started

A few weeks ago, I had what seemed like a straightforward task: create a healthcare data standard for the T1D Exchange Data Specification. I had Excel files full of clinical concepts, quality metrics, and data elements that I could have analyzed in depth given my healthcare and standards experience, but I wanted to see how AI collaboration could free me from that detailed analysis work and let me focus on strategic direction instead.

What I didn't expect was how this would turn into one of the most interesting technical collaborations I've had - and how quickly we could go from concept to a comprehensive healthcare interoperability standard.

So I started a conversation with Amazon Q with the basic request: help me understand these Type 1 Diabetes care specifications and transform them into a working healthcare data exchange standard.

But first, I knew I needed to create clear requirements. I wrote a project context file that outlined the goals, stakeholders, and initial requirements. This became our north star - a reference point that Q could use to understand the bigger picture and make decisions aligned with the project's objectives. As we learned more about T1D care and refined our approach, this context evolved too. Having that initial requirements document was crucial for getting started on the right path.

I have to say, the first version that Q created was remarkably good - it gave us a solid foundation to iterate from. That's the power of starting with clear requirements and letting AI handle the systematic implementation.

## The Power of Rapid Iteration

What struck me most was the speed of iteration. We could go through multiple design cycles in a single conversation - from identifying problems to implementing solutions to testing results.

This rapid iteration showed up everywhere:
- **Documentation**: Feedback about pages being too long led to immediate reorganization proposals
- **Research**: Mentioning alignment needs triggered research and specific recommendations
- **Error Resolution**: Instead of fixing individual issues, Q would systematically address whole categories of problems
- **Architecture Decisions**: Major changes could be implemented and tested quickly
- **Publishing**: Q set up automated publishing so every improvement was immediately available for review

But rapid iteration had challenges too. Content duplication crept in as we added features, requiring periodic reviews to maintain coherence. This taught me that with AI collaboration, you need to occasionally step back and look at the big picture.

## Multi-Skilled Technical Partner

One aspect that surprised me was how Q seamlessly shifted between different types of work as the project demanded. While our primary focus was healthcare standards development, Q would write software when needed to solve specific problems.

When I needed to extract detailed specification data from the Excel files, Q created a data extraction script that could parse multiple Excel sheets, extract variable definitions, priorities, and notes, and output structured data. This wasn't just basic file reading - Q handled complex Excel structures, data cleaning, and formatted the output specifically for our needs.

The script processed over 380 variables across 10 different specification sheets, extracting exactly the data we needed in the format we could use. Q wrote, tested, and refined the code in real-time as part of our conversation.

This highlighted something important about AI collaboration: you're not just working with a domain expert or a technical writer - you're working with a partner that can shift between different types of technical work as the project requires. Standards development, documentation writing, data extraction, build troubleshooting - all seamlessly integrated into a single collaborative workflow.

## The Human-AI Sweet Spot: Like Pair Programming, But Different

This collaboration reminded me strongly of pair programming from Agile development - where two developers work together, with one "driving" (writing code) and the other "navigating" (reviewing and providing direction). The benefits are well-documented: fewer bugs, better design decisions, and faster development.

Our human-AI collaboration followed a similar pattern:

**Traditional Pair Programming:**
- Driver writes code, Navigator reviews and guides
- Both partners have similar technical capabilities
- Real-time collaboration on the same problem

**Human-AI Collaboration:**
- AI "drives" implementation, Human "navigates" strategy and quality
- Complementary rather than similar capabilities
- Real-time collaboration across different types of work

What I brought:
- Strategic direction and quality judgment
- Real-world perspective on what would actually work
- Domain expertise in healthcare standards

**What Q brought:**
- Ability to research and understand clinical domains from specifications
- Systematic execution across multiple technical areas
- On-demand software development capabilities
- Pattern recognition for identifying and resolving issues

Neither of us could have created this comprehensive standard alone in the same timeframe. Like effective pair programming, this wasn't just about dividing work - it was about continuous collaboration where each partner's strengths amplified the other's capabilities.



## Lessons Learned

**Start simple and iterate:** We began with basic structures and added complexity based on need. This kept us from over-engineering early on.

**Research existing solutions:** Learning from existing work was crucial. Why reinvent when you can adapt proven patterns?

**Keep the human in the loop:** Strategic decisions and quality judgment were crucial. AI is incredibly capable, but human oversight on priorities and trade-offs was essential.

**Focus on end-user needs:** Every decision came back to "Will this help or hurt the people who need to implement this?" This kept us grounded in practical reality.

## Broader Applications

While this project focused on healthcare standards, I think we've demonstrated an approach that could apply to many technical domains. The key insight is maintaining human strategic oversight while leveraging AI's ability to execute systematic implementation consistently and quickly.

This isn't about AI replacing human expertise - it's about amplifying it. Domain experts can focus on architecture, strategy, and quality judgment while AI handles research, systematic implementation, and detailed execution.

## Looking Forward

What started as "help me map Excel specifications to a healthcare standard" became a comprehensive foundation that could potentially address real problems for Type 1 Diabetes care coordination, quality improvement, and research - pending expert review and real-world testing.

You can review our current work at:
- **Published Standard**: https://sirkyp.github.io/fhir-t1d-exchange/
- **GitHub Repository**: https://github.com/sirkyp/fhir-t1d-exchange

## Final Thoughts

Building this healthcare standard with AI assistance was one of the most productive technical collaborations I've experienced. We went from Excel specifications to a comprehensive foundation in a matter of days, not months.

But the real win wasn't just speed - it was the quality of the collaboration. Having an AI partner that could research, implement, and iterate quickly while I focused on strategic direction and quality judgment felt like a glimpse into the future of technical work.

If you're working on complex technical projects - whether in healthcare, software development, or other domains - I'd encourage you to explore this kind of human-AI collaboration. The results might surprise you.
