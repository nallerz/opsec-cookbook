# Contributing
Contributors Welcome! Please check out the guiding principles for the project below. Feel free to suggest changes here as well.

## Library principles:
1. **Hierarchy of information**
- The enemy of good information is bad organization
- Topics will go wide and deep, constantly evaluate how contributed information fits into the bigger picture
- You are encouraged to challenge the organization of the library to make this repo better!
2. **Copyrighted content**
- Please don't commit copyrighted material to the repo
- Links, or code to pull materials down from external sources is acceptable

## Toolkit Design Principles:

1. **Code as infrastructure**
- we cannot build black box solutions, binaries, etc.
- toolkits should be recipes & automation scripts that pool various open source resources together to achieve the desired features
- a toolkit, when [implemented, executed, employed] by the user should produce an environment, device, or other solution. However the toolkit itself is not the solution. 
- Example: a toolkit in the repo could be a script that when run by the user ultimately outputs a secure, preconfigured Raspbian environment. The toolkit is not the image itself.
 
2. **Simplicity**
- complexity is the enemy
- perfection is the enemy's biggest ally
- tradeoffs will be necessary. For hardware, perhaps that means trading the best component for one that is the most practical or a widely available. For software, that means leave out the tiny polish feature that doubles the amount of code and is of low functional value.

3. **Necessity + ease of audit**
- Toolkits must be trustworthy and thus have auditability
- For better auditability, tradeoffs will be necessary that err toward simplicity

4. **Common languages**
- There is no strict language requirement, however the project will see more success of we stick to common languages/patters
- suggestions:
  - bash
  - python
  - docker / docker-compose yaml (cool use case is the shell script to setup bitwarden self hosted on docker. Google it.)
  - scripting tools/languages

5. **High stakes**
- Remember that a lot is at stake for users of these toolkits. There is no such thing as 100% solutions and dev time is limited. However Please include comments to call out shortcuts, flaws, or areas where future enhancements could improve functionality or security in the future.


