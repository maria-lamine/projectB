library(tidyverse)

# 1. Create output folder for figures
dir.create("output/figures", recursive = TRUE, showWarnings = FALSE)

# 2. Load the processed dataset
df <- readRDS("data/processed_data.rds")
theme_set(theme_minimal())

# 3. Figure 1: Biomarker Distribution
p1 <- ggplot(df, aes(x = biomarker_ng_ml)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Biomarker Measurements",
       x = "Biomarker (ng/mL)", y = "Count")
ggsave("output/figures/fig1_biomarker_distribution.png", plot = p1, width = 6, height = 4)

# 4. Figure 2: Control vs Treatment Comparison
p2 <- ggplot(df, aes(x = group, y = biomarker_ng_ml, fill = group)) +
  geom_boxplot(alpha = 0.6) +
  geom_jitter(width = 0.1, size = 2) +
  labs(title = "Biomarker Levels: Control vs Treatment",
       x = "Group", y = "Biomarker (ng/mL)") +
  theme(legend.position = "none")
ggsave("output/figures/fig2_group_comparison.png", plot = p2, width = 6, height = 4)

# 5. Figure 3: Age Effect
p3 <- ggplot(df, aes(x = age, y = biomarker_ng_ml, color = group)) +
  geom_point(size = 2.5) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Biomarker vs Age by Group",
       x = "Age (Years)", y = "Biomarker (ng/mL)")
ggsave("output/figures/fig3_age_vs_biomarker.png", plot = p3, width = 6, height = 4)

# 6. Figure 4: Sex Effect
p4 <- ggplot(df, aes(x = sex, y = biomarker_ng_ml, fill = sex)) +
  geom_boxplot(alpha = 0.6) +
  geom_jitter(width = 0.1, size = 2) +
  labs(title = "Biomarker Levels by Sex",
       x = "Sex", y = "Biomarker (ng/mL)") +
  theme(legend.position = "none")
ggsave("output/figures/fig4_sex_vs_biomarker.png", plot = p4, width = 6, height = 4)

# 7. Figure 5: Confounding Check
p5 <- ggplot(df, aes(x = group, y = age, fill = group)) +
  geom_boxplot(alpha = 0.6) +
  geom_jitter(width = 0.1, size = 2) +
  labs(title = "Age Distribution Across Groups (Confounding Check)",
       x = "Group", y = "Age (Years)") +
  theme(legend.position = "none")
ggsave("output/figures/fig5_confounding_age_by_group.png", plot = p5, width = 6, height = 4)

print("SUCCESS: All 5 figures generated in output/figures!")