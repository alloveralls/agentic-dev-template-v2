DOC_FILES := $(shell find . \
	-type f \
	\( \
		-name 'README.md' -o \
		-name 'TEMPLATE_SETUP.md' -o \
		-path './.github/*.md' -o \
		-path './.github/**/*.md' -o \
		-path './.work-logs/templates/*.md' -o \
		-name 'AGENTS.md' -o \
		-name 'DESIGN.md' \
	\) | sort)

.PHONY: help docs-check lint-md link-check typos-check

help:
	@printf '%s\n' \
		'Available targets:' \
		'  make docs-check   Run all documentation checks' \
		'  make lint-md      Run markdownlint-cli2 on documentation files' \
		'  make link-check   Run lychee on documentation files' \
		'  make typos-check  Run typos on documentation files' \
		'' \
		'Files:' \
		$(foreach file,$(DOC_FILES),'  $(file)')

docs-check: lint-md link-check typos-check

lint-md:
	@command -v markdownlint-cli2 >/dev/null 2>&1 || { \
		echo 'markdownlint-cli2 is required. Install it with: npm install -g markdownlint-cli2'; \
		exit 1; \
	}
	markdownlint-cli2 --config .github/.markdownlint.json $(DOC_FILES)

link-check:
	@command -v lychee >/dev/null 2>&1 || { \
		echo 'lychee is required. Install it from https://github.com/lycheeverse/lychee'; \
		exit 1; \
	}
	lychee \
		--verbose \
		--no-progress \
		--timeout 20 \
		--max-concurrency 4 \
		--retry-wait-time 2 \
		--max-retries 2 \
		$(DOC_FILES)

typos-check:
	@command -v typos >/dev/null 2>&1 || { \
		echo 'typos is required. Install it from https://github.com/crate-ci/typos'; \
		exit 1; \
	}
	typos --config .github/.typos.toml $(DOC_FILES)
