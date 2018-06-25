---
title: Introduction to Dynamic Semantics
subtitle: Lecture 1
author: Patrick D. Elliott
date: 25.06.2018
...

$$
\newcommand{\eval}[2][]{{\left[\!\!\left[\text{#2}\right]\!\!\right]^{#1}}}
\newcommand{\evalM}[2][]{{\left[\!\!\left[ #2 \right]\!\!\right]^{#1}}}
\newcommand{\Set}[1]{\left\lbrace #1 \right\rbrace}
\newcommand{\lam}[1]{{\lambda #1\,.\,}}
\newcommand{\type}[1]{{\mathtt{#1}}}
\newcommand{\metalang}[1]{{\textbf{#1}}}
\newcommand{\entity}[1]{{\texttt{#1}}}
$$

# Lecture 1: Pronouns, quantification, and assignment sensitivity 

## Slides

- pdf: <https://patrl.keybase.pub/actl2018/lecture1.pdf>
- html (sketchy): <https://patrickdelliott.com/actl2018notes.html>

## Roadmap

- An overview of what semanticists are interested in.

- A lightning-fast overview of some basic formal machinery: sets, functions, and lambdas.

- Constructing our first formal language L~1~.

- *First Order Logic* (FOL)

- Next week: *Dynamic Predicate Logic* (DPL)

## Formal semantics

 - This class is going to provide you with an introduction to *formal
   semantics*.
   
 - What formal semantics is *not*:
   - A theory of the connotations and cultural associations of particular words and phrases. 
   - A theory of how we communicate through language.
   - A theory of concepts, and how we acquire them.
   
 - Rather formal semantics is typically concerned with the *logical* (i.e.
   *formal*) properties of language. Arguably, a theory of formal semantics
   should inform all of the above.
   
## Formal semantics ii
   
 - But...why isn't this class called *Introduction to Formal Semantics*?
 
 - The particular perspective we're going to work towards is that of *dynamic
   semantics*, a family of theories developed in the eighties and nineties by
   Irene Heim, Hans Kamp, Jeroen Groenendijk, Martin Stokhof, Paul Dekker, and others.
   
## Dynamic Semantics

 - Dynamic semantics is an approach to formal semantics which provides a unified
   perspective on anaphora, quantification, and the flow of discourse.
   
 - In the first part of the class, we're going to work towards an analysis of
   *donkey anaphora*, illustrated by the famous example sentence in (@donkey),
   using Groenendijk and Stokhof's theory *Dynamic Predicate Logic*.
   
   (@donkey) every farmer who owns a donkey$^x$ hits it$_x$
   
## Dynamic semantics ii

 - In most introductory classes, what is taught is a strictly *static*
   semantics, where the unit of analysis is strictly the *sentence*.
   
 - One of the key insights of dynamic semantics is that, not just sentences, but
   *discourses* can be assigned truth-conditions.
   
   (@disc) A man$^x$ walked in the room. He$_x$ sat down.
   
 - (@disc) is true iff there is a man $x$, s.t. $x$ walked in the room and $x$.
 
## Dynamic semantics iii

- One thing we're going to be thinking through is the relationship between a
  static semantics a dynamic semantics.
  
- In today's class, we're going to work towards a formal, static semantics of English,
  using First Order Logic as our tool.
  
- But first, some broad perspectives on the study of meaning in natural language.

## In the beginning, there was syntax

- It's all about this guy:

![Noam Chomsky (right)](images/chomsky.jpg){ width=50% }

## In the beginning, there was syntax ii

- (Generative) syntax, when you really get down to it, is the study of
  an individual language (or idiolect) $L$. A "language", such as English, is
  just a useful abstraction over a set of sufficiently similar $L$s. 
  
- The question syntacticians ask themselves is:
  how can we specify what the possible sentences of $L$ are?
  
## Syntactic methodology
  
- Typically, syntacticians do this by giving a *grammar* of $L$.

- Depending on your theory, a grammar can be a set of rewrite rules, a recursive procedure for building
  structured representations, or a combinary logic. It amounts to
  more-or-less the same thing at the end of day.
  
- A grammar of $L$ is taken to be an abstract description of What We Know When
  We Know $L$.
  
## An aside

- Some (generative) theories of syntax:
  - Lexical Functional Grammar, Combinary Categorial Grammar, Minimalism, ...

 - I'm going to try to stay as neutral as possible about which flavour of syntax
 tastes the best.
 
 - When I *have* to say something about syntax, I'm going to assume a simplified
   version of Chomsky's Government and Binding theory, since it's the one that
   most people seem to have been exposed to.
   
 - I'm happy to argue about, e.g., construction grammar, in the pub...not so much in
   class.

## Syntactic intuitions ii

- How do we know what a possible sentence of $L$ is?
  - If we're a native speaker of $L$, we can consult our own intuitions about
    the acceptability of a given sentence.
  - We can consult a native speaker of $L$.

- The vast majority of the raw data syntacticians deal with is *speaker
  acceptability judgements*, be they collected informally or experimentally.
  
## Meaning as truth-conditions

- To know the meaning of a sentence is to know its *truth conditions*.

![Polish mathematician and Logician Alfred Tarski  
(src: the Oberwolfach photo collection)](images/tarski.jpg){ width=50% }

## Meaning as truth-conditions

(@russians) Russians penetrated U.S. voter systems.

- We don't need to know whether or not (@russians) is *true* to know what it *means*.

- What we do know (roughly), is how the world would have to be for (@russians)
  to be true -- (@russians) is *true* if Russians penetrated U.S. voter systems,
  and *false* otherwise. 
  
- Is this just stating the obvious?

## Syntactic intuitions 

- (Generative) syntax, when you really get down to it, is the study of
  an individual language (or idiolect) $L$. The question we ask ourselves is - how
  can we specify what the possible sentences of $L$ are?
  
- Typically, we do this by giving a *grammar* of $L$. Depending on your theory,
  a grammar can be a set of rewrite rules, a recursive procedure for building
  structured representations, a combinatorial logic, etc etc. It all amounts to
  more-or-less the same thing at the end of day.

## Syntactic intuitions ii

- How do we know what a possible sentence of $L$ is?
  - If we're a native speaker of $L$, we can consult our own intuitions about
    the acceptability of a given sentence.
  - We can consult a native speaker of $L$.

- The vast majority of the raw data syntacticians deal with is *speaker
  acceptability judgements*, be they collected informally or experimentally.

## Back to semantics

 - Let's say we're studying the semantics of a given language $L$, and we have
   the syntax of $L$ pretty well-worked out. 
   
 - Our task as semanticists is to specify a recursive procedure for mapping
   sentences of $L$ to *meanings*.
   
 - How do we know what a given sentence of $L$ means? Just as before, we have to
   rely on native speaker intuitions.
   
## Truth conditions

 - But, we can't just ask our native speaker, what does "snow is white" *mean*?
   We're bound to get a vague or unhelpful answer. Try this out yourselves (if
   you want to annoy your friends).
   
 - Instead, we can ask our native speaker, if in a given situation, a sentence
   of $L$ is *true*, and through asking these questions, we can infer the
   sentences truth-conditions.
   
   (@) If snow is black, is "snow is white" true?
   
## Truth conditions ii

- In many situations, the results seem bleedingly obvious, but it very quickly
  gets more interesting (and complicated).
  
 (@) At least one person from every country has eaten most of its national dishes.
 
 - Semantics then, involves developing a recursive procedure for mapping
   sentences of $L$ to their *truth-conditions*.
   
  - One of the reasons why the Tarskian conjecture doesn't seem so interesting
    at first sight, is that the language that we're using to describe
    truth-conditions is *English*.
    
## The meta- and object- language

- We call the language we use to specify the truth-conditions of a given
  sentence our *metalanguage*.
  
- We call the language we're interested in interpreting - in this case English -
  the *object language*.
  
- When the metalanguage and object language are the same, statements of
  truth-conditions have the feeling of circularity.
  
- What we need, if we're going to develop a satisfactory semantic theory, is a
  completely unambiguous metalanguage, the meaning of which we can state in a
  completely rigorous way...what we need, if a *formal* language.

## Natural language as a formal language

> I reject the contention that an important theoretical difference exists
> between formal and natural languages’ (Montague, 1970)

![the philosopher Richard Montague (1930-1971)](images/montague.jpg){ width=30% }

## Interpretation as a *process*

 - The *dynamic turn* in formal semantics: meaning doesn't lie in *truth
   conditions*, but rather in how a given sentence changes the beliefs of the
   participants (Stalnaker, Heim, Kamp, Groenendijk and Stokhof, etc.).

![the philosopher Robert Stalnaker](images/stalnaker.jpg){ width=50% }

## the semantics of programming languages

 - The perspective on semantics we'll be working towards has important
   connections with the semantics of *programming languages* (here we circle
   back to the Montagovian program).
   
 - In computer science, the *meaning* of a program is how it affects an abstract
   machine *state*. The *state* can be, e.g., the allocation of values to
   locations in memory.
   
- The meaning of a program, therefore, can be thought of as an *instruction for
  changing the current state*.
  
- We'll see examples of this next week.

## Reference

- See [Elizabeth Coppock's primer](http://eecoppock.info/DynamicSemantics/Lectures/logic-2up.pdf).
 
- <http://eecoppock.info/DynamicSemantics/Lectures/logic-2up.pdf>

- If I go too fast for you today, please go back and work through this. The
  majority of
  what I'll go through is here, in a condensed format.

# Some background, lightning fast

## Truth-tables for propositional logic -- *and*

- *and* ($∧$)

$$
\begin{aligned}[t]
&P &Q & &P ∧ Q\\
&1 &1 & &1\\
&1 &0 & &0\\
&0 &1 & &0\\
&0 &0 & &0
\end{aligned}
$$

## *or*

- *or (inclusive disjunction)* ($∨$)

$$
\begin{aligned}[t]
&P &Q & &P ∨ Q\\
&1 &1 & &1\\
&1 &0 & &1\\
&0 &1 & &1\\
&0 &0 & &0
\end{aligned}
$$

## *if...then...*

- *if then (material implication)* ($→$)

$$
\begin{aligned}[t]
&P &Q & &P → Q\\
&1 &1 & &1\\
&1 &0 & &0\\
&0 &1 & &1\\
&0 &0 & &1
\end{aligned}
$$

## *if and only if*

- *iff (biconditional)* ($↔$)

$$
\begin{aligned}[t]
&P &Q & &P ↔ Q\\
&1 &1 & &1\\
&1 &0 & &1\\
&0 &1 & &0\\
&0 &0 & &0
\end{aligned}
$$

## Set theory

This is a set:

$$
\Set{2,4,6}
$$

This is a set:

$$
\Set{x | x\text{ is a positive even integer less than }7}
$$

These are in fact...the same set.

## The empty set

- This is a set:

$$
\Set{}
$$

- Another way of writing this set is: $\emptyset$.

- There's only ONE $\emptyset$!!! These are all identical to $\emptyset$:

$$
\begin{aligned}[t]
&\Set{x | x\text{ is a married bachelor}}\\
&\Set{x | x\text{ is an even prime number and }x\text{ is not }2}\\
&\Set{x | x\text{ is a reasonably priced flat in Bloomsbury}}
\end{aligned}
$$

## Relations on sets

- $A ⊆ B$ – $A$ is a \alert{subset} of $B$ iff every member of $A$ is a member of $B$.
  this means that $∅$ is a subset of every set (including itself!)
  
- $A ⊂ B$ – $A$ is a \alert{proper subset} of $B$ iff $A ⊆ B$ but $A ≠ B$.

- $A ∪ B$ – the \alert{union} of $A$ and $B$ is the set of all $x$ s.t. $x ∈ A$ or $x ∈ B$.

- $A ∩ B$ – the \alert{intersection} of $A$ and $B$ is the set of all $x$ in both $A$
  and $B$.
  
- $A − B$ – the \alert{difference} of $A$ and $B$ is the set of $x$, s.t. $x ∈
  A$ but $x ∉ B$.
  
## Ordered pairs

- $⟨\metalang{Jeff},\metalang{Britta}⟩$ is the ordered pair of $\metalang{Jeff}$ and $\metalang{Britta}$.

- unlike sets, ordered pairs are order-sensitive:

    $⟨\metalang{Jeff},\metalang{Britta}⟩ ≠ ⟨\metalang{Jeff},\metalang{Britta}⟩$
    
 - ordered pairs are objects just like anything else, so we can gather them up
   in sets.
   
   $$
   \Set{⟨x,y⟩| x\text{ hugs }y}
   $$

## Functions

- A function is something that takes an *input*, and returns a unique *output*.

- For example the operation $f$, which takes an integer and adds $1$ to it. Here
  are some different ways of writing this function:
  
  $$f(x) = x + 1$$
  
  $$
  \left[\begin{aligned}[c]
  &0 \rightarrow 1\\
  &1 \rightarrow 2\\
  &3 \rightarrow 4\\
  &...
  \end{aligned}\right]
  $$
  
## Graphs of functions
  
- $f$ can also be represented as a *set of ordered pairs*, where the first
  member of the pair is the input, and the second is the output. This is called
  the *graph* of the function.
  
  $$\Set{..., ⟨0,1⟩,⟨1,2⟩,⟨3,4⟩,...}$$

  $$\Set{⟨x,y⟩|x\text{ is an integer and }y = x + 1}$$
  
## Anonymous functions with lambdas

- When we wrote the function $f$, we had to give it a name...$f$.

- There's another way to write $f$ without naming it, using a *lambda
  expression*.
  
$$λ x . x + 1$$

- A lambda expression consists of a *head* (the bit before the dot), and the
  *body* (the bit after the dot).
  
- The function head consists of a $λ$ and an accompanying variable, which tells
  us where the argument slots into the function body.
  
- The function body tells us what to do with our argument.

## Application

- We *apply* lambda expressions to values like so:

$$
[λ x . x + 1](4)
$$

- When we apply a lambda expression to an argument, we delete the function head,
  and substitute all matching occurrences of the variable with the argument, so:
  
  $$
   \begin{aligned}[t]
   &̱= 4 + 1\\
   &= 5
   \end{aligned}
  $$

## Nested lambda expressions

- What if we have a function $\textit{subtract}$ that takes two arguments?

$$\textit{subtract}(x,y) = y - x$$

- We can write this as a *curried* (nested) lambda expression, like so:

$$
λx . λ y . y - x
$$

## Nested lambda expressions ii

- Application is left-associative:

$$
\begin{aligned}[t]
&[λ x . λ y . y - x](4)(5)\\
&= [λ y . y - 4](5)\\
&= 5 - 4\\
&= 1
\end{aligned}
$$

- Note that out the output of applying our function to $4$ is *itself* a function:
$λ y . y - 4$.

- Lambda expressions come from the *lambda calculus* – a formal system for
  expressing computation. It's something of a lingua franca in formal semantics,
  but it's a big topic, and I'll try to avoid using it in this class.

  
# Our first formal language: L~1~

## First-order logic without variables

- We'll define a language for dealing with things like verbs and proper names. Let's call it L~1~.
  
- We'll be able to use this language for specifying the truth-conditions of
  sentences like the following:
  
  (@) If Jeff is annoying, then Britta and Annie are bored.  
  $(\metalang{annoying}(J)) → ((\metalang{bored}(B) ∧ \metalang{bored}(A)))$
  
  (@) Troy likes Abed and not Pierce.  
  $\metalang{likes}(T,A) ∧ ¬\metalang{likes}(T,P)$
  
- Don't worry about how to interpret these logical translations just yet. We'll
  get onto that in a sec.
  
## Logical Form

- The logical translation (and hence disambiguation) of natural language
  sentences corresponds to philosophers' notion of *Logical Form*.

![the philosopher Bertrand Russell (1872-1970)](images/russell.jpg){ width=50% }

- This is an important idea philosophically, as the inferential properties of a
  sentence can be read directly off of its Logical Form.
  
## Describing a formal language

- Just like Montague said, the tasks of describing a formal language like L~1~ and a natural
  language like English are really quite similar.
  
- Just like English, L~1~ has a *vocabulary*, which is exactly what it sounds
  like.
  
- Just like English, L~1~ has a *syntax* – this will consist of a set of rules
  for constructing grammatical sentences of L~1~, which, following the parlance
  of logicians, we'll call *well-formed formulae* (wff) of L~1~.
  
- Because L~1~ abstracts away from many of the complexities of English,
  including ambiguity, we'll also be able to give a *semantics* for L~1~, which
  will consist of a procedure for computing the truth-conditions of any given wff.

## Vocabulary of L~1~

1. Individuals contstants/terms: $\textsf{Troy}$, $\textsf{Annie}$,
   $\textsf{Britta}$, etc

   These correspond to *proper names* and *definite
   descriptions* in English.
   
2. Unary predicates: $\textsf{happy}$, $\textsf{bored}$, etc

    These correspond to *adjectives* and *intransitive verbs* in English.

3. Binary predicates: $\textsf{kissed}$, $\textsf{loves}$

    These correspond to *transitive verbs* in English.

## Syntax of L~1~

1. If $π$ is a unary predicate and $α$ is a term, then $π(α)$ is a formula.

2. If $π$ is a binary predicate and α and β are terms, then $π(α,β)$ is a formula.

3. If $ϕ$ is a formula, then $¬ϕ$ is a formula.

4. If $ϕ$ and $ψ$ are formulas, then $[ϕ ∧ ψ]$ is a formula.

5. If $ϕ$ and $ψ$ are formulas, then $[ϕ ∨ ψ]$ is a formula.

6. If $ϕ$ and $ψ$ are formulas, then $[ϕ → ψ]$ is a formula.

7. If $ϕ$ and ψ$ are formulas, then $[ϕ ↔ ψ]$ is a formula.

## An aside on recursion

![Morris Halle (1923-2018) and Noam Chomsky (src: Kai von Fintel)](images/recursion.jpg){ width=50% }

## recursion ii

 > For example, the most elementary property of the language faculty is the
 > property of discrete infinity; you have six-word sentences, seven-word
 > sentences but you don’t have six-and-a-half-word sentences. Furthermore,
 > there is no limit; you can have ten-word sentences, twenty-word sentences and
 > so on indefinitely. That is the property of discrete infinity. (Chomsky, 2000
 > – *The Architecture of Language*)
 
## Chomskyan rewrite rules

- Task: use the following set of rewrite rules to generate some sentences.
  Convince yourself that there is no limit to the number of sentences you can generate.

$$
\begin{aligned}[&]
&\text{V} → \text{hugs}\,|\,\text{kisses}\\
&\text{V'} → \text{say} | \text{believe}\\
&\text{NP} → \text{Britta} | \text{Annie}\\
&\text{VP} → \text{V} \text{NP}\\
&\text{VP} → \text{V'} \text{S}\\
&\text{S} → \text{NP} \text{VP}
\end{aligned}
$$

- What is the crucial component here that is responsible for your ability to
  generate an unlimited number of different sentences?
  
## An even simpler instance of recursion

$$
\begin{aligned}[t]
&\text{S} → \text{S and S}\\
&\text{S} → \text{S or S}\\
&\text{S} → \text{if S then S}
&\end{aligned}
$$

- Does this look familiar?

## Discrete infinity

- our specification of the syntax of L~1~ is *recursive*, just like Chomsky's
  rewrite rules!

4. If $ϕ$ and $ψ$ are \alert{formulas}, then $[ϕ ∧ ψ]$ is a \alert{formula}.

5. If $ϕ$ and $ψ$ are \alert{formulas}, then $[ϕ ∨ ψ]$ is a \alert{formula}.

6. If $ϕ$ and $ψ$ are \alert{formulas}, then $[ϕ → ψ]$ is a \alert{formula}.

- If we're gonna have *any* hope of analysing the meaning of a natural language using a *formal language* such as L~1~, we better hope that our formal language
  is capable of matching natural language's capacity for discrete infinity.

## Questions on syntax of L~1~ 

 - Given a suitable vocabulary, which of the following are formulae of L~1~?

1. $¬¬\metalang{happy}(M)$

2. $\metalang{happy}(A)$

3. $\metalang{happy}(M,J)$

4. $\metalang{loves}(J,M) ∨ \metalang{loves}(M,M)$

5. $[\metalang{loves}(J,M) ↔ \metalang{loves}(M,J)]$

6. $[\metalang{kissed}(M) ↔ \metalang{loves}(M,J)]$

7. $¬[\metalang{loves}(J,M) ← ¬\metalang{loves}(M,J)]$



## Semantics

- The semantics for L~1~ is given in terms of a *model*, i.e., a mathematical
  description of a toy universe.
  
![src: *A Philosopher Lecturing on the Orrery*, Joseph Wright of Derby](images/orrery.jpg)

## Semantics ii

$$
M = ⟨D, I⟩
$$

-  $D$ is the *domain* of all individuals in $M$.

- $I$ is the *interpretation function*; it tells us what the vocabulary of L~1~
  means in $M$.
  
  - our mathematical description of the toy universe therefore, tells us who and
    what exists, and what the expressions in the vocabulary of the language
    we're interested in pick out.
    
## Semantics iii

- The interpretation of an *individual constant*, which you can think of as a
  proper name, will be an individual in the domain.
   
- The interpretation of a unary predicate will be a *set* of individuals.

  e.g., the interpretation of *run* is the set of individuals who run.

- The interpretation of a binary predicate will be a binary relation between
  individuals, i.e., a set of ordered pairs.
  
  e.g., the interpretation of *hugs* is the set of ordered pairs $⟨x,y⟩$, such
  that $x$ hugs $y$.
  
## A note on type-setting conventions

- When we think though the meaning of the English NP "Homer", we need to
  distinguish three levels:
  
  - The object-language expression "Homer", which will be set in the same
    typeface as my notes. This is an NP/DP in the natural language English.
    
  - The metalanguage expression $\metalang{Homer}$, which is an individual
    constant in the vocabulary of our formal language – I'll set metalanguage
    expressions in a serif typeface.
    
  - The person $\entity{Homer}$, who is an entity in our domain. I'll typeset
    entities in the domain in a fixed-width typeface. 
    
- It's important to be mindful of these distinctions as we move forwards...I'm
not perfect, and I might typeset things incorrectly sometimes. It's good
practice for you to correct me if/when this happens!
  
## Semantics iv

 - task: Add some *ternary predicates* to L~1~ (i.e., predicates that take three arguments).
   - what is the interpretation of a ternary predicate in $M$?
   - what syntactic category does a ternary predicate correspond to, intuitively?
   
## Semantics of L~1~ (definition)

 - If $α$ is a predicate or an individual constant, then:
   - $\evalM[M]{α} = I(α)$.
   
 - If $π$ is a unary predicate and $α$ is a individual constant, then:
    - $\evalM[M]{ϕ(α)} = 1\text{ if }\evalM[M]{α} ∈ \evalM[M]{π}$
    - $\evalM[M]{ϕ(α)} = 0$ otherwise
    
 - N.b. we're gonna save ourselves some time in the future by writing *if and
   only if* (iff), to give truth and falsity conditions in one line. Since we're
   assuming the excluded middle (every formula is either true or false), this is harmless.
   
 - Note that $\evalM[M]{.}$ is itself a *function* from any vocabulary item or
   formula $α$ of L~1~ to the semantic value of $α$ in our model $M$.
   
## Semantics of L~1~ continued

- if $π$ is a binary predicate, and $α$ and $β$ are terms, then:
  - $\evalM[M]{π(α,β)} = 1 \mathrm{iff} ⟨\evalM[M]{α},\evalM[M]{β}⟩ ∈ \evalM[M]{π}$
  
- $\evalM[M]{¬ϕ} = 1  \mathrm{iff} \evalM[M]{ϕ} = 0$

- $\evalM[M]{ϕ ∧ ψ} = 1 \mathrm{iff} \evalM[M]{ϕ} = 1 \mathrm{and} \evalM[M]{ψ}
  = 1$
- $\evalM[M]{ϕ ∨ ψ} = 1 \mathrm{iff} \evalM[M]{ϕ} = 1 \mathrm{or} \evalM[M]{ψ}
  = 1$
- $\evalM[M]{ϕ → ψ} = 1 \mathrm{unless} \evalM[M]{ϕ} = 1 \mathrm{and} \evalM[M]{ψ}
  = 0$
- $\evalM[M]{ϕ ↔ ψ} = 1 \mathrm{iff} \evalM[M]{ϕ} = \evalM[M]{ψ}$

## Recursion

- Let's look again at our rule for the semantic value of a conjunctive formula:

- $\evalM[M]{ϕ ∧ ψ} = 1 \mathrm{iff} \evalM[M]{ϕ} = 1 \mathrm{and} \evalM[M]{ψ}$

- $\evalM{.}$...is a recursive function! In other words, it can recycle it's own
  output as input.
  
- If we have a recursive syntax, then we better have a recursive semantics.

## Recursive semantics

- Compute the truth-conditions of the following well-formed formula of L~1~.

$$
(\metalang{happy}(\metalang{Jeff}) ∧ \metalang{happy}(\metalang{Troy})) ∧ \metalang{bored}(\metalang{Britta})
$$

## Exercise

- Convert the following sentences of English into well-formed formulae of L~1~,
and compute their truth-conditions. 

(@) If Jeff is happy, then Britta and Annie are bored.

(@) if Jeff is happy, then Britta is bored or Annie is bored.

(@) Britta isn't bored or happy.

- Make a note of any interesting decision points in translating the sentences of English into formulae of L~1~.

## English as a formal language

 - have we made good on Montague's conjecture?
 
 - Right now, we can only deal with proper names and verbs – we still have a
   long way to go.
   
 - AND as you may have noticed, the procedure for translating English into L~1~
   relies to a large extent on intuition.
   
## The syntax-semantics interface

(@) If Jeff is happy, then Britta is bored or Annie is bored.

- There were two valid translations:

(@) $\metalang{happy}(J) → (\metalang{bored}(B) ∨ \metalang{bored}(A))$

(@) $(\metalang{happy}(J) → \metalang{bored}(B)) ∨ \metalang{bored}(A)$

- Can our procedure for translating sentences of English into formulae ever be
  completely deterministic? What would help?
  
## Structural ambiguity

\input{trees/reading1.tex}

(@) $\metalang{happy}(J) → (\metalang{bored}(B) ∨ \metalang{bored}(A))$

## Structural ambiguity ii

\input{trees/reading2.tex}

(@) $(\metalang{happy}(J) → \metalang{bored}(B)) ∨ \metalang{bored}(A)$

## Compositional semantics

- What we want is a procedure for mapping each *terminal node* to an element of
  our *vocabulary*, and each *non-terminal node* to a well-formed formula.
  
- This is the study of *syntax-semantics interface*, and encompasses a great
  deal of what formal semanticists do, especially in the generative tradition.
  
- I won't really be going into much depth about how this works in this class,
  but if you're interested, the *locus classicus* is @Heimb, but see also
  @jacobson_compositional_2014 for an excellent contemporary introduction. 
  
## Compositional semantics ii 

- Instead, we're going to rely on our semantic intuitions for translating
  English into a formal language, and go from there.
  
- All of the action will be in thinking through what *syntactic* properties our
  formal language should have, and  moreover, specifying a semantics for the
  language which indirectly captures our intuitions about the truth-conditions
  of English sentences.

## First Order Logic (FOL)

- Consider the following sentences of English:

(@) Someone is happy.

(@) It's not the case that everyone is bored.

(@) She is sitting down.

 - Rather than using proper names, we're using *quantificational NPs* like
   *someone*, and *pronouns* like *she*.

## Syntax of FOL

- Note that quantificational NPs and pronouns have the same distribution as
  proper names.
  
- This makes it easy enough to add some extra resources to L~1~.

## Syntax of FOL ii

- For pronouns we're going to add *variables*, for which we'll use the letters
  $x$, $y$, $z$, etc. We'll refer to both *individual constants* like
  $\metalang{Jeff}$ and variables as *terms*.
  
  Why not just add *he, she, they* etc., to our vocabulary as constants? We'll
  see why when we get to the semantics. 
  
- We're also going to add two new logical operators: $∃$, and $∀$, which
  correspond to *someone* and *everyone* (roughly).
  
## Syntax of FOL iii

- the first part of the syntax is just our syntax of L~1~, but with *individual
  constant* replaced by *term*. This means that variables can occupy the same
  environments as proper names. 

1. If $π$ is a unary predicate and $α$ is a \alert{term}, then $π(α)$ is a formula.

2. If $π$ is a binary predicate and α and β are \alert{terms}, then $π(α,β)$ is a formula.

3. If $ϕ$ is a formula, then $¬ϕ$ is a formula.

4. If $ϕ$ and $ψ$ are formulas, then $[ϕ ∧ ψ]$ is a formula.

5. If $ϕ$ and $ψ$ are formulas, then $[ϕ ∨ ψ]$ is a formula.

6. If $ϕ$ and $ψ$ are formulas, then $[ϕ → ψ]$ is a formula.

7. If $ϕ$ and ψ$ are formulas, then $[ϕ ↔ ψ]$ is a formula.

## Syntax of FOL iv

- Quantificational operators are accompanied by variables:

8. If $u$ is a variable and $ϕ$ is a formula, then $∃uϕ$ is a formula.

9. If $u$ is a variable and $ϕ$ is a formula, then $∀uϕ$ is a formula.

## Open vs. closed formulae

- A formula is *open* if it contains free variables, and *closed* otherwise.

- Free variables are those that are not *bound*.

- A variable is *bound* by the closest matching quantifier.

- Task: for each of the following formulae, is it open or closed:

1. $∃ y[\metalang{likes}(x,y)]$

2. $∀ x[\metalang{happy}(x)] ∧ \metalang{arrived}(x)$

3. $∃ z[\metalang{hugs}(z)(z)]$



## Towards a semantics of FOL

- Before we get into the formal nitty-gritty, I want you to think about the
  meaning of the following sentence. Is it possible to express in terms of
  *truth-conditions*?
  
  (@pro) She is Donald Trump's wife.
  
- What factors does the interpretation of (@pro) depend on?

## Assignments

 - Intuitively, whether or not (@pro) is true, depends on who the speaker
   intended to refer to with the pronoun *she*. 
   
 - If the speaker intended to refer to Melania Trump, then (@pro) is true, and
   otherwise it is false.
   
## Assignments ii

 - We can use multiple occurrences of the same pronoun to refer to different
   individuals.
   
   (@) She is Donalid Trump's wife and *she* is Bill Clinton's wife.
   
 - For this reason, we have to relativize the truth of a sentence to who the
   speaker intended each *tokening* of a pronoun to refer to.
   
 - This is why we need something like variables in our formal language. We need
   a device for distinguishing between occurrences of pronouns.
   
## Assignments iii

- As a notational convenience, we will write things like this:

(@) She$_x$ is Donald Trump's wife, and she$_y$ is Bill Clinton's wife.

- This tells us that the first *she* corresponds to the variable $x$ in the
  logical translation, and the second *she* corresponds to the variable $y$.
  
## Assignments iv

- Ok, so the translation of *She$ₓ$ is Donald Trump's wife* is the following:

$$
\metalang{wife}(\metalang{Trump},x)
$$

- How do we capture the notion that the truth of this formula is relative to who
the pronoun refers to?

- We're going to *relativise* truth, to a *context* $g$. Formally, $g$ is a
  function from variables to objects, i.e., an *assignment function*.
  
## Assignments v

$$
g₁ = \left[\begin{aligned}[c]
    &x &↦ &\entity{Melania}\\
    &y &↦ &\entity{Hilary}\\
    &...
    \end{aligned}\right]
$$

$$
g₂ = \left[\begin{aligned}[c]
    &x &↦ &\entity{Hilary}\\
    &y &↦ &\entity{Melania}\\
    &...
    \end{aligned}\right]
$$

## Assignments vi

- $\metalang{wife}(\metalang{Trump},x)$ is true relative to the assignment $g₁$
  but false relative to the assignment $g₂$.
  
## Assignments vii

- From now on, interpretation isn't just relative to a model $M$, but also
  relative to an assignment $g$.
  
- Instead of $\evalM[M]{ϕ}$, we write $\evalM[M,g]{ϕ}$.

- The interpretation of a variable $x$ is just whatever the assignment $g$ maps
it to.

- $\evalM[M,g]{x} = g(x)$

- $\evalM[M,g₁]{x} = \entity{Melania}$;  $\evalM[M,g₂]{x} = \entity{Hilary}$ 

## Semantics of FOL

- The most important new rule we'll be dealing with is the following:

- If $α$ is a variable, then $\evalM[M,g]{α} = g(α)$

- Most of the rest of our semantic rules will be identical to those of L~1~, but
  with an additional parameter for the assignment $g$.
  
## Semantics of FOL ii

- If $α$ is a predicate or an individual constant, then:
   - $\evalM[M,g]{α} = I(α)$.
   
 - If $π$ is a unary predicate and $α$ is a individual constant, then:
    - $\evalM[M,g]{ϕ(α)} = 1\text{ if }\evalM[M,g]{α} ∈ \evalM[M,g]{π}$
    - $\evalM[M,g]{ϕ(α)} = 0$ otherwise
    
 - if $π$ is a binary predicate, and $α$ and $β$ are terms, then:
   - $\evalM[M,g]{π(α,β)} = 1 \metalang{iff} ⟨\evalM[M,g]{α},\evalM[M,g]{β}⟩ ∈ \evalM[M,g]{π}$
   
## Semantics of FOL iii

- $\evalM[M,g]{¬ϕ} = 1  \metalang{iff} \evalM[M,g]{ϕ} = 0$

- $\evalM[M,g]{ϕ ∧ ψ} = 1 \metalang{iff} \evalM[M,g]{ϕ} = 1 \metalang{and} \evalM[M,g]{ψ}
  = 1$
- $\evalM[M,g]{ϕ ∨ ψ} = 1 \metalang{iff} \evalM[M,g]{ϕ} = 1 \metalang{or} \evalM[M,g]{ψ}
  = 1$
- $\evalM[M,g]{ϕ → ψ} = 1 \metalang{unless} \evalM[M,g]{ϕ} = 1 \metalang{and} \evalM[M,g]{ψ}
  = 0$
- $\evalM[M,g]{ϕ ↔ ψ} = 1 \metalang{iff} \evalM[M,g]{ϕ} = \evalM[M,g]{ψ}$

## Pronouns

- We now have all of the resources we need for translating a subset of sentences
  of English with pronouns into FOL, and assigning them truth-conditions. Do
  this for the following sentence:
  
  (@indices) She arrived and she sat down.
  
 - Make a note of the decisions you have to make when you translate (@indices)
   into FOL.
   - What do you notice?
   - How does it affect the truth conditions.
   
## Pronouns ii

 - There are two candidate translations (Logical Forms) for (@indices):
 
 (@indices1) $\metalang{arrived}(x) ∧ \metalang{satDown}(x)$
 
 (@indices2) $\metalang{arrived}(x) ∧ \metalang{satDown}(y)$
 
## Co-indexation

$$\begin{aligned}[t]
\evalM[M,g]{\metalang{arrived}(x) ∧ \metalang{satDown}(x)} = 1\metalang{ iff }\\
g(x) ∈ I(\metalang{arrived})\text{ and }g(x) ∈ I(\metalang{satDown})
\end{aligned}$$

- Since an *assignment function* is a *function*, when we map two pronouns to
  the same variable, they are *guaranteed* to pick out the same individual
  relative to any assignment.
  
## Contra-indexation

$$\begin{aligned}[t]
\evalM[M,g]{\metalang{arrived}(x) ∧ \metalang{satDown}(y)} = 1\metalang{ iff }\\
g(x) ∈ I(\metalang{arrived})\text{ and }g(y) ∈ I(\metalang{satDown})
\end{aligned}$$

 - when we map two pronouns to distinct variables, is it *guaranteed* that they
   pick out distinct variables, relative to any assignment?
   
## Contra-indexation ii

 - no.
 
 - Consider the assignment $g_c = \left[\begin{aligned}[c]
   &x &↦ &\entity{Hilary}\\
   &y &↦ &\entity{Hilary}\\
 \end{aligned}\right]$
 
$$\begin{aligned}[t]
\evalM[M,g_c]{\metalang{arrived}(x) ∧ \metalang{satDown}(y)} = 1\metalang{ iff }\\
\entity{Hilary} ∈ I(\metalang{arrived})\text{ and }\entity{Hilary} ∈ I(\metalang{satDown})
\end{aligned}$$

## Contra-indexation iii

- but, if we map two pronouns to distinct variables, we make it *possible* for
  them to pick out distinct individuals. Consider the following assignment $g_d = \left[\begin{aligned}[c]
   &x &↦ &\entity{Hilary}\\
   &y &↦ &\entity{Melania}\\
 \end{aligned}\right]$
 
$$\begin{aligned}[t]
\evalM[M,g_d]{\metalang{arrived}(x) ∧ \metalang{satDown}(y)} = 1\metalang{ iff }\\
\entity{Hilary} ∈ I(\metalang{arrived})\text{ and }\entity{Melania} ∈ I(\metalang{satDown})
\end{aligned}$$

## Assignments and contexts

- We can think of an assignment $g$ as formalising aspects of the *context of
  utterance*.
  
- $g_c$ represents a context in which both "she$ₓ$" and "she$_y$" are intended
  to pick out $\entity{Hilary}$.
  
- $g_d$ represents a context in which "she$ₓ$" is intended to pick out
  $\entity{Hilary}$, and "she$_y$" is intended to pick out $\entity{Melania}$.
  
## Assignments and the global environment

- Computer programs often need access to a *global environment*.

- For example, imagine a program that pull's a user's first name and surname
  from a database, and concatenates them.
  
- The *meaning* of this program can be thought of as assignment sensitive:

```
query g  
println (g(firstName) ++ g(surname))
```

- $g$ here is an assignment function, standing in for an entry in a database
  specifying an individuals first name and surname.
  
## Assignments and the global environment ii

- The formal tools computer programmers use for thinking about the role the
  global environment plays look *extremely* similar to the tools we're using to
  analyse the *context*.
  
- If you have some background in programming, take a look at the *Reader* monad
  in functional languages like *Haskell*.
  
- If not don't worry - hopefully the basic idea is intuitive enough.
  
## Back to quantificational NPs

- we still haven't said anything about the meaning of sentences like the
  following:
  
  (@) Someone arrived.
  
  (@) Everyone arrived.
  
- It turns out that *assignments* provide us with the machinery to analyse these
cases too.

## The informal idea

(@exist1) Someone arrived.

(@exist2) $\evalM[M,g]{∃ x[\metalang{arrived}(x)]}$

- When is (@exist2) true relative to an assignment $g$?

- Intuitively, it's truth is *assignment-invariant* – that is to say that it
  doesn't depend on what the context of utterance is.
  
- It's true just in case we can find *any* assignment $g'$, which is identical
  to $g$ except for what it assigns $x$ to, which makes (@exist2) true.
  
## Illustration

(@) $\entity{arrive} = \Set{\entity{Melania}}$

(@) $g = \left[\begin{aligned}[c]
&x &↦ &\entity{Hilary}\\
&y &↦ &\entity{Melania}
\end{aligned}\right]$

- the truth of $\evalM[M,g]{∃ x[\metalang{arrived}(x)]}$ doesn't depend on what
  $g$ maps $x$ to, but rather if we can find a $g'$ that maps $x$ to someone
  that arrived.
  
- We can find such a $g'$: $\left[\begin{aligned}[c]
&x &↦ &\entity{Melania}\\
&y &↦ &\entity{Melania}
\end{aligned}\right]$

## Formalism

- We can state the rule for quantificational sentences more formally like so;

- $\evalM[M,g]{∃ v ϕ} = 1$ iff there is at least one $g'$ s.t. $g[v]g'$ and $\evalM[M,g']{∃ v ϕ} = 1$

- $\evalM[M,g]{∀ v ϕ} = 1$ iff for every $g'$ s.t. $g[v]g'$, $\evalM[M,g']{∃ v ϕ} = 1$

## Minimally differing assignments

- Why do we look at only *minimally* differing assignments?

(@) $∃ x[\metalang{arrive}(x) ∧ \metalang{satDown}(y)]$

- Let's say that we're in a context with the following $g$:
$\left[\begin{aligned}[c]
&x &↦ &\entity{Melania}\\
&y &↦ &\entity{Hilary}
\end{aligned}\right]$

- And let's say that it's true that Hilary arrived but only Melania sat down.

## Minimally differing assignments ii

- Well, if we're allowed to look at assignments that differ in more than just
  what $x$ gets mapped to, then we *can* find an assignment $g'$ which makes the
  formula true.
  
  $$
  g' = \left[\begin{aligned}[c]
  &x &↦ &\entity{Hilary}\\
  &y &↦ &\entity{Melania}
  \end{aligned}\right]
  $$
  
- This is clearly a bad prediction though – the truth of the previous formula
should depend on who $y$ picks out in the context of utterance.

    
## Non-determinism

- We can think of existential quantifiers as triggering a *non-deterministic computation*. When
  considering the truth of $∃x[\metalang{arrive}(x)]$, we compute the truth of
  statements of the form $α ∈ I(\metalang{arrive})$, where $α$ is some object.
  
- As soon as we find one that is true, we travel back to a deterministic world,
  by stating that the formula is true.
  
## Non-determinism ii
  
- This is going to be important once we start looking at dynamic semantics. 

- For now it is important to remember that this is just a metaphor to help you
  think about what existential quantification is doing. See Simon Charlow's
  dissertation for some (very advanced) reading on the connections between
  existential quantification and non-determinism.
  
## Exercises

- Translate the following sentences of English into FOL and compute their
  truth-conditions. To make life easier for you, I'm going to diambiguate
  indexation.
  
  (@) It's not the case that someone$^x$ likes themselves$_x$.
  
  (@) If someone is upset, then everyone is unhappy.
  
  (@scopeAmbig) Someone danced with everyone.
  
- Note all of these sentences are ambiguous. Think about how we can use FOL to
  represent the ambiguity.

## Towards a semantics of discourses

- Translate the following into FOL:

(@) Someone$ˣ$ walked in. She$ₓ$ sat down.

- You can assume that two consectutive sentences are *conjoined*.

## Two candidate translations

- Conjunction scopes over existential: 

(@) $[∃ x[\metalang{walkedIn}(x)]] ∧ \metalang{satDown}(x)]$

- Existential scopes over conjunction:

(@) $∃x[\metalang{walkedIn}(x) ∧ \metalang{satDown}(x)]$

- *Exercise:* Compute the truth conditions of both formulae. What do you notice?

## Conjunction scopes over existential

(@) $\begin{aligned}[t]
&\evalM[M,g]{∃x[\metalang{walkedIn}(x)] ∧ \metalang{satDown}(x)} = 1\text{ iff
}\\
&∃ g'[g[x]g' ∧ g'(x) ∈ I(\metalang{walkedIn})] ∧ (g(x) ∈ I(\metalang{satDown}))
\end{aligned}$

- This seems like a *bad* translation. It can be true, e.g., if only Hilary
  walked in, and only Melania sat down.
  
- Intuitively, it doesn't matter than the two variables are the same, since the
  second variable is outside of the scope of the existential quantifier.

## Existential scopes over conjunction

(@) $\begin{aligned}[t]
&\evalM[M,g]{∃x[\metalang{walkedIn}(x) ∧ \metalang{satDown}(x)]} = 1\text{ iff
}\\
&∃ g'[g[x]g' ∧ g'(x) ∈ I(\metalang{walkedIn}) ∧ g'(x) ∈ I(\metalang{satDown})]
\end{aligned}$

- This seems like a good translation – it is only true the same person both
  walked in and sat down. This is because both variables are within the scope of
  the existential quantifier.
  
## Whats's the problem

- Well, why don't we just allow existential quantifiers to scope out of the
  sentences which contain them?
  
- Problem 1: other quantificational NP's don't behave like this.

    (@) Everyone$ˣ$ walked in. He$ₓ$ sat down.
    
    This cannot be translated as:  
    
    (@) $∀ x[\metalang{walkedIn}(x) → \metalang{satDown}(x)]$
    
## What's the problem ii

- The most robust methodological principle in formal semantics is Frege's
  *principle of compositionality*.
  
![the philosopher Gottlob Frege (1848-1925)](images/frege.jpg){ width=30% }

## What's the problem iii

- Frege's principle of compostionality has had innumerable reformulations, and I
  won't bore you with the original German. In its essence, it says:
  
  *The meaning of a sentence is a function of \alert{the meaning of its parts}
  and \alert{how they are put together}*.
  
- Let's think about how we would translate the *parts* of the following
  sentence:
  
(@) Someone walked in and he sat down.

## What's the problem iv

 - conjunct 1: $∃ x[\metalang{walkedIn}(x)]$
 
 - conjunct 2: $\metalang{satDown}(x)$
 
 - The principle of compositionality tells us that the meaning of a
   *conjunctive* sentence should be the conjunction of the meaning of its parts,
   so we get:
   
 - $∃x[\metalang{walkedIn}(x)] ∧ \metalang{SatDown}(x)$
 
 - our more successful translation violates the principle of compositionality!
 
## What's the problem v

 - It's important to state that, in practice, the principle of compositionality
   is a *methodological* principle, and is not always inviolable.
   
 - However, all else being equal, it would be nice to be able to account for the
   data we've just been considering in a way consistent with the principle of
   compositionality.
   
 - *Dynamic semantics* will allow us to do just that!



