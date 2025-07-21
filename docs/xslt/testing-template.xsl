<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
  
  <xsl:template match="/testing_specification">
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title><xsl:value-of select="metadata/project_name"/> - テスト仕様書</title>
        <link rel="stylesheet" type="text/css" href="../css/specifications.css"/>
      </head>
      <body>
        <div class="container">
          <div class="header">
            <h1><xsl:value-of select="metadata/project_name"/></h1>
            <div class="subtitle">テスト仕様書</div>
          </div>

          <div class="metadata">
            <h2>ドキュメント情報</h2>
            <div class="metadata-grid">
              <div class="metadata-item">
                <span class="metadata-label">プロジェクト名</span>
                <div class="metadata-value">
                  <xsl:choose>
                    <xsl:when test="metadata/project_name != ''">
                      <xsl:value-of select="metadata/project_name"/>
                    </xsl:when>
                    <xsl:otherwise><span class="empty-value"></span></xsl:otherwise>
                  </xsl:choose>
                </div>
              </div>
              <div class="metadata-item">
                <span class="metadata-label">バージョン</span>
                <div class="metadata-value">
                  <xsl:choose>
                    <xsl:when test="metadata/version != ''">
                      <xsl:value-of select="metadata/version"/>
                    </xsl:when>
                    <xsl:otherwise><span class="empty-value"></span></xsl:otherwise>
                  </xsl:choose>
                </div>
              </div>
            </div>
          </div>

          <div class="content">
            <xsl:if test="test_strategy">
              <div class="section">
                <h2 class="section-header">テスト戦略</h2>
                <div class="section-content">
                  <div class="subsection">
                    <h3 class="subsection-header">テストアプローチ</h3>
                    <p><xsl:value-of select="test_strategy/testing_approach"/></p>
                  </div>
                  <xsl:if test="test_strategy/test_levels/test_level">
                    <div class="subsection">
                      <h3 class="subsection-header">テストレベル</h3>
                      <ul class="item-list">
                        <xsl:for-each select="test_strategy/test_levels/test_level">
                          <li class="item">
                            <div class="item-header">
                              <xsl:value-of select="@name"/>
                            </div>
                            <div class="item-content">
                              <p><strong>範囲:</strong> <xsl:value-of select="@scope"/></p>
                              <p><strong>目的:</strong> <xsl:value-of select="@objectives"/></p>
                            </div>
                          </li>
                        </xsl:for-each>
                      </ul>
                    </div>
                  </xsl:if>
                </div>
              </div>
            </xsl:if>

            <xsl:if test="unit_testing/unit_test_cases/test_case">
              <div class="section">
                <h2 class="section-header">単体テスト</h2>
                <div class="section-content">
                  <ul class="item-list">
                    <xsl:for-each select="unit_testing/unit_test_cases/test_case">
                      <li class="item">
                        <div class="item-header">
                          <span class="item-id"><xsl:value-of select="@id"/></span>
                          <xsl:value-of select="name"/>
                        </div>
                        <div class="item-content">
                          <p><strong>説明:</strong> <xsl:value-of select="description"/></p>
                          <p><strong>対象コンポーネント:</strong> <xsl:value-of select="target_component"/></p>
                          <p><strong>期待結果:</strong> <xsl:value-of select="expected_result"/></p>
                        </div>
                      </li>
                    </xsl:for-each>
                  </ul>
                </div>
              </div>
            </xsl:if>

            <xsl:if test="integration_testing/integration_test_cases/test_case">
              <div class="section">
                <h2 class="section-header">結合テスト</h2>
                <div class="section-content">
                  <ul class="item-list">
                    <xsl:for-each select="integration_testing/integration_test_cases/test_case">
                      <li class="item">
                        <div class="item-header">
                          <span class="item-id"><xsl:value-of select="@id"/></span>
                          <xsl:value-of select="name"/>
                        </div>
                        <div class="item-content">
                          <p><strong>説明:</strong> <xsl:value-of select="description"/></p>
                          <p><strong>テスト対象:</strong> <xsl:value-of select="components_under_test"/></p>
                          <p><strong>期待動作:</strong> <xsl:value-of select="expected_behavior"/></p>
                        </div>
                      </li>
                    </xsl:for-each>
                  </ul>
                </div>
              </div>
            </xsl:if>

            <xsl:if test="performance_testing/performance_objectives/objective">
              <div class="section">
                <h2 class="section-header">パフォーマンステスト</h2>
                <div class="section-content">
                  <div class="subsection">
                    <h3 class="subsection-header">パフォーマンス目標</h3>
                    <ul class="item-list">
                      <xsl:for-each select="performance_testing/performance_objectives/objective">
                        <li class="item">
                          <div class="item-header">
                            <xsl:value-of select="@metric"/>
                          </div>
                          <div class="item-content">
                            <p><strong>目標値:</strong> <xsl:value-of select="@target_value"/></p>
                            <p><strong>測定方法:</strong> <xsl:value-of select="@measurement_method"/></p>
                          </div>
                        </li>
                      </xsl:for-each>
                    </ul>
                  </div>
                </div>
              </div>
            </xsl:if>

            <xsl:if test="test_automation/automation_strategy">
              <div class="section">
                <h2 class="section-header">テスト自動化</h2>
                <div class="section-content">
                  <div class="subsection">
                    <h3 class="subsection-header">自動化戦略</h3>
                    <p><strong>自動化範囲:</strong> <xsl:value-of select="test_automation/automation_strategy/automation_scope"/></p>
                    <p><strong>ツール選択:</strong> <xsl:value-of select="test_automation/automation_strategy/tool_selection"/></p>
                  </div>
                </div>
              </div>
            </xsl:if>
          </div>

          <div class="navigation">
            <div class="nav-links">
              <a href="../development/index.html" class="nav-link">← 開発</a>
              <a href="../index.html" class="nav-link">目次</a>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>